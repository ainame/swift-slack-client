import Foundation
import SlackBlockKit
import SlackBlockKitDSL

/// Examples demonstrating Markdown block usage
public enum MarkdownExample {
    /// Basic markdown block example
    public static var basicMarkdown: Block {
        Markdown("# Hello World\n\nThis is a **markdown** block with *formatting* support.")
            .render()
    }

    /// Markdown block using result builder
    public static var resultBuilderMarkdown: Block {
        Markdown {
            "# Project Status Report"
            ""
            "## Completed Tasks"
            "- ✅ Setup CI/CD pipeline"
            "- ✅ Implement authentication"
            "- ✅ Add unit tests"
            ""
            "## In Progress"
            "- 🚧 User dashboard"
            "- 🚧 API documentation"
            ""
            "**Next sprint starts:** _Monday, June 3rd_"
        }
        .blockId("status_report")
        .render()
    }

    /// Complex markdown with links and formatting
    public static var complexMarkdown: Block {
        Markdown("""
        # 📊 Performance Metrics

        | Metric | Current | Target | Status |
        |--------|---------|--------|--------|
        | Response Time | 120ms | <150ms | ✅ |
        | Uptime | 99.8% | >99.5% | ✅ |
        | Error Rate | 0.1% | <0.5% | ✅ |

        > **Note:** All metrics are within acceptable ranges

        For more details, see the [full report](https://example.com/report)
        """)
        .blockId("performance_metrics")
        .render()
    }
}

/// Home tab view using Markdown blocks
public struct MarkdownHomeTab: SlackHomeTabView {
    public var blocks: [Block] {
        Header {
            Text("📝 Markdown Demo")
        }

        MarkdownExample.basicMarkdown

        Divider()

        MarkdownExample.resultBuilderMarkdown

        Divider()

        MarkdownExample.complexMarkdown

        Context {
            Text("💡 Markdown blocks support full Slack markdown syntax")
        }
    }

    public var callbackId: String {
        "markdown_demo"
    }
}
