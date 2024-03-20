"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.data = void 0;
const backend_1 = require("@aws-amplify/backend");
const schema = backend_1.a.schema({
    Product: backend_1.a
        .model({
        name: backend_1.a.string(),
        description: backend_1.a.string(),
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    TrainingInfo: backend_1.a.model({
        month: backend_1.a.string(),
        year: backend_1.a.string(),
        status: backend_1.a.enum(['TRAINED', 'UNTRAINED']),
        type: backend_1.a.enum(['GHW', 'TBHIV', 'LMIS', 'HCT', 'AFB_Microscopy']),
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    WareHouseFacilities: backend_1.a.model({
        type: backend_1.a.enum(['FACILITY', 'WAREHOUSE']),
        name: backend_1.a.string().required(),
        id: backend_1.a.string().required()
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    Position: backend_1.a.model({
        name: backend_1.a.string()
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    LGAInfo: backend_1.a.model({
        name: backend_1.a.string(),
        id: backend_1.a.string().required(),
        facilities: backend_1.a.hasMany('WareHouseFacilities'),
        members: backend_1.a.hasMany('User'),
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    StateInfo: backend_1.a.model({
        name: backend_1.a.string(),
        lgas: backend_1.a.hasMany("WareHouseFacilities"),
        members: backend_1.a.hasMany('User'),
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    ZonalInfo: backend_1.a.model({
        name: backend_1.a.string(),
        states: backend_1.a.hasMany("WareHouseFacilities"),
        members: backend_1.a.hasMany('User'),
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    nationalInfo: backend_1.a.model({
        name: backend_1.a.string(),
        states: backend_1.a.hasMany("WareHouseFacilities"),
        members: backend_1.a.hasMany('User'),
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    User: backend_1.a.model({
        id: backend_1.a.string(),
        name: backend_1.a.string().required(),
        email: backend_1.a.email().required(),
        designation: backend_1.a.string().required(),
        cadre: backend_1.a.string(),
        partner: backend_1.a.string(),
        position: backend_1.a.hasOne('Position'),
        title: backend_1.a.string(),
        primaryNumber: backend_1.a.string(),
        secondaryNumber: backend_1.a.string(),
        microscopy: backend_1.a.hasOne('TrainingInfo')
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    MicroscopesInfo: backend_1.a.model({
        source: backend_1.a.string(),
        status: backend_1.a.enum(['FUNCTIONAL', 'NON_FUNCTIONAL']),
        dateReceived: backend_1.a.date()
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    Facility: backend_1.a.model({
        facility: backend_1.a.hasOne('WareHouseFacilities'),
        contact: backend_1.a.hasOne('User'),
        location: backend_1.a.string(),
        trainings: backend_1.a.hasMany('TrainingInfo'),
        type: backend_1.a.string().required(),
        level: backend_1.a.enum(["PHC_PPM", 'PHC_Govt', 'Secondary_Govt', 'Secondary_PPM', 'Tertiary_Govt', 'Tertiary_PPM']),
        operation: backend_1.a.enum(['Govt', 'Faith_Based', 'Private', 'NGO', 'Unknow']),
        tbhiv: backend_1.a.enum(['STANDALONE', 'TBHIV']),
        microscopy: backend_1.a.enum(['AVAILABLE', 'UNAVAILABLE']),
        microscopyContact: backend_1.a.hasOne('User'),
        microscopesInfo: backend_1.a.hasMany('MicroscopesInfo'),
        stockCard: backend_1.a.hasMany('StockCard')
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    StockCard: backend_1.a.model({
        product: backend_1.a.hasOne('Product').required(),
        location: backend_1.a.hasOne('WareHouseFacilities'),
        receiver: backend_1.a.string().required(),
        date: backend_1.a.datetime().required(),
        quantityIssued: backend_1.a.integer(),
        quantityReceived: backend_1.a.integer(),
        remarks: backend_1.a.string(),
        stockBalance: backend_1.a.integer(),
        lossesAdjustements: backend_1.a.integer(),
        batchNo: backend_1.a.string().required(),
        expiryDate: backend_1.a.date().required()
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    Supply: backend_1.a.model({
        sender: backend_1.a.hasOne('User'),
        receiver: backend_1.a.hasOne('User'),
        products: backend_1.a.hasMany('DeliveryItem'),
        type: backend_1.a.string().required(),
        sendDate: backend_1.a.date().required(),
        status: backend_1.a.string().required(),
        completeReceivedDate: backend_1.a.date()
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    ProductBatch: backend_1.a.model({
        product: backend_1.a.hasOne('Product'),
        batch: backend_1.a.string().required(),
        quantity: backend_1.a.string().required(),
        expiryDate: backend_1.a.date().required(),
        location: backend_1.a.hasOne('WareHouseFacilities')
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
    DeliveryItem: backend_1.a.model({
        supply: backend_1.a.belongsTo('Supply'),
        batchInfo: backend_1.a.hasOne("ProductBatch"),
        receivedDate: backend_1.a.date().required(),
    })
        .authorization([backend_1.a.allow.owner(), backend_1.a.allow.public()]),
});
exports.data = (0, backend_1.defineData)({
    schema,
    authorizationModes: {
        defaultAuthorizationMode: 'apiKey',
        // API Key is used for a.allow.public() rules
        apiKeyAuthorizationMode: {
            expiresInDays: 30,
        },
    },
});
