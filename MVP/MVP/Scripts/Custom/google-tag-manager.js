(function (w, d, s, l, i) {
    w[l] = w[l] || [];
    w[l].push({
        'gtm.start': new Date().getTime(), event: 'gtm.js'
    });
    var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s),
        dl = l != 'dataLayer' ? '&l=' + l : '';
    j.async = true;
    j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
    f.parentNode.insertBefore(j, f);
})
(window, document, 'script', 'dataLayer', 'GTM-55D9S86');

function GTM_Transaction(id, fare, mgm, cost, tax, route, date, seats) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push({
        'event': 'Transaction',
        'transactionId': id,
        'transactionFare': fare,
        'transactionMGM': mgm,
        'transactionTotal': cost,
        'transactionTax': tax,
        'transactionProducts': [{
            'route': route,
            'date': date,
            'seats': seats
        }]
    });
}

function GTM_Signup(id, email, name) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push({
        'event': 'Signup',
        'userId': id,
        'email': email,
        'name': name
    });
}

function GTM_Login(id) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push({
        'event': 'Login',
        'userId': id
    });
}

