function GTM_Transaction(id, promocode, fare, mgm, cost, tax, route, type, date, seats) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push({
        'event': 'Transaction',
        'transactionId': id,
        'transactionAffiliation': promocode,
        'transactionFare': fare,
        'transactionMGM': mgm,
        'transactionTotal': cost,
        'transactionTax': tax,
        'transactionProducts': [{
            'sku': route,
            'name': route,
            'category': type,
            'date': date,
            'price': cost,
            'quantity': seats
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

