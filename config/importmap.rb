# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "el-transition", to: "https://ga.jspm.io/npm:el-transition@0.0.7/index.js"
pin "axios", to: "https://ga.jspm.io/npm:axios@1.3.2/index.js"
pin "#lib/adapters/http.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/@empty.js"
pin "#lib/platform/node/classes/FormData.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/@empty.js"
pin "#lib/platform/node/index.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/@empty.js"
