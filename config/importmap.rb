# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "lodash", to: "https://ga.jspm.io/npm:lodash@4.17.21/lodash.js"

pin "flowbite", to: "https://ga.jspm.io/npm:flowbite@1.6.3/lib/esm/index.js"
pin "alpinejs", to: "https://ga.jspm.io/npm:alpinejs@3.11.1/dist/module.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/lib/index.js"
