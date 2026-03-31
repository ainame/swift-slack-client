# Practical Examples

Runtime-oriented examples for `SlackApp` and `SlackKit`, including `SlackApp`'s Events API payload types.

## Socket Mode Integration

### Interactive Task Management

Combining Block Kit views with `SlackApp` routing and Socket Mode handlers for interactive task management.

> Note: `SlackApp` auto-acknowledges Events API handlers. Slash commands, actions, shortcuts, and views still need explicit `ack()`. Router registrations are overwrite-based, and `onSlackMessageMatched(...)` was removed in favor of `onEvent(MessageEvent.self)` plus in-handler filtering.

```swift
// Slash command handler
router.onSlashCommand("/tasks") { context, payload in
    try await context.ack()

    let tasks = try await TaskService.getUserTasks(userId: payload.userId)
    let taskList = TaskListView(tasks: tasks, userId: payload.userId)

    try await context.respond(
        responseType: .ephemeral,
        blocks: taskList.blocks
    )
}

// Button interaction handler
router.onBlockAction("create_task") { context, payload in
    try await context.ack()

    let modal = TaskCreationModal(userId: payload.user.id)

    try await slack.client.viewsOpen(
        body: .json(.init(
            triggerId: payload.triggerId,
            view: modal.render()
        ))
    )
}

// View submission handler
router.onViewSubmission("create_task") { context, payload in
    let title = payload.view.state?["title_block", "task_title"]?.value ?? ""
    let priority = payload.view.state?["priority_block", "task_priority"]?.selectedOption?.value ?? "medium"
    let assigneeId = payload.view.state?["assignee_block", "task_assignee"]?.selectedUser

    let task = try await TaskService.createTask(
        title: title,
        priority: Priority(rawValue: priority) ?? .medium,
        assigneeId: assigneeId,
        createdBy: payload.user.id
    )

    let successView = Modal("Task Created") {
        Header { Text("Success! ✅") }

        Section {
            Text("Task '*\(task.title)*' has been created successfully.")
                .style(.mrkdwn)
        }

        Actions {
            Button("View Task")
                .actionId("view_task_\(task.id)")
                .style(.primary)

            Button("Create Another")
                .actionId("create_another_task")
        }
    }
    .close(Text("Done"))

    try await context.ack(responseAction: .update, view: successView.asView())
}

struct TaskListView: SlackView {
    let tasks: [Task]
    let userId: String

    var blocks: [Block] {
        Header {
            Text("Your Tasks")
        }

        Actions {
            Button("Create Task")
                .actionId("create_task")
                .style(.primary)

            StaticSelect("filter_tasks") {
                Option("All Tasks").value("all")
                Option("My Tasks").value("mine")
                Option("High Priority").value("high")
                Option("Due Today").value("today")
            }
            .placeholder("Filter tasks")
        }

        Divider()

        if tasks.isEmpty {
            Section {
                Text("_No tasks found. Create your first task!_")
                    .style(.mrkdwn)
            }
        } else {
            for task in tasks {
                Section {
                    Text("*\(task.title)*")
                        .style(.mrkdwn)
                    Text(task.summary)
                }
                .accessory(
                    Button("Open")
                        .actionId("open_task_\(task.id)")
                )
            }
        }
    }
}
```
