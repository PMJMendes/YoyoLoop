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

