// From: https://www.osano.com/cookieconsent/download/
window.cookieconsent.initialise({
    "palette": {
        "popup": {
            "background": "#2d5a7a",
            "text": "#42eadd"
        },
        "button": {
            "background": "#f76201",
            "text": "#fdfaf5"
        }
    },
    "type": "opt-out",
    "content": {
        // "href": "https://wndx.school/p/privacy"
    },
    onInitialise: function (status) {
        let type = this.options.type;
        let didConsent = this.hasConsented();
        if (type == 'opt-out' && !didConsent) {
            disableGAonOptOut();
            deleteGACookies();
        } else {
            loadGA();
        }
    },
    onStatusChange: function(status, chosenBefore) {
        let type = this.options.type;
        let didConsent = this.hasConsented();
        if (type == 'opt-out' && !didConsent) {
            // disable cookies
            disableGAonOptOut();
            deleteGACookies();
        } else {
            loadGA();
        }
    },
    onRevokeChoice: function() {
        let type = this.options.type;
        if (type == 'opt-out') {
            // enable cookies
            loadGA();
        }
    }
});
