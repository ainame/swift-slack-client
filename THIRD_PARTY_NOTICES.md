Third-Party Notices

This repository's original code is licensed under the MIT License. In addition,
the repository uses third-party upstream materials during code generation and
redistributes derived/generated outputs based on those materials.

The following upstream projects are used as generation inputs:

1. slackapi/java-slack-sdk
   Repository: https://github.com/slackapi/java-slack-sdk
   Role in this repository:
   - Sample Web API response payloads used to infer response schemas
   - Sample Events API payloads used to infer event schemas
   - Upstream behavior references for targeted compatibility fixes in generation scripts
   License: MIT
   Copyright:
   - Copyright (c) 2020 -      Slack Technologies, LLC
   - Copyright (c) 2016 - 2019 Kazuhiro Sera (@seratch)

2. slack-ruby/slack-api-ref
   Repository: https://github.com/slack-ruby/slack-api-ref
   Role in this repository:
   - Web API method metadata used to derive request parameters and method descriptions
   License: MIT
   Copyright:
   - Copyright (c) 2015-2017 Daniel Doubrovkine, Artsy and Contributors

This repository includes generated Web API and Events/Models layers derived
from the upstream reference data above. The Swift implementation and
integration code are original to this repository unless otherwise noted.

The full upstream MIT license texts are reproduced below.

--------------------------------------------------------------------------
slackapi/java-slack-sdk
--------------------------------------------------------------------------

(The MIT License)

Copyright (c) 2020 -      Slack Technologies, LLC
Copyright (c) 2016 - 2019 Kazuhiro Sera (@seratch)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--------------------------------------------------------------------------
slack-ruby/slack-api-ref
--------------------------------------------------------------------------

MIT License

Copyright (c) 2015-2017 Daniel Doubrovkine, Artsy and Contributors

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
