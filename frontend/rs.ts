import {a, defineData, type ClientSchema} from '@aws-amplify/backend';
const schema = a.schema({
  Product: a
    .model({
      name: a.string(),
      description: a.string(),
    })
    .authorization([a.allow.owner(), a.allow.public()]),
  TrainingInfo: a.model({
    month: a.string(),
    year: a.string(),
    status: a.enum(['TRAINED', 'UNTRAINED']),
    type: a.enum(['GHW', 'TBHIV', 'LMIS', 'HCT', 'AFB_Microscopy']),
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  WareHouseFacilities: a.model({
    type: a.enum(['FACILITY', 'WAREHOUSE']),
    name: a.string().required(),
    id: a.string().required()
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  Position: a.model({
    name: a.string()
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  LGAInfo: a.model({
    name: a.string(),
    id: a.string().required(),
    facilities: a.hasMany('WareHouseFacilities'),
    members: a.hasMany('User'),
  })
    .authorization([a.allow.owner(), a.allow.public()]),

  StateInfo: a.model({
    name: a.string(),
    lgas: a.hasMany("WareHouseFacilities"),
    members: a.hasMany('User'),
  })
    .authorization([a.allow.owner(), a.allow.public()]),

  ZonalInfo: a.model({
    name: a.string(),
    states: a.hasMany("WareHouseFacilities"),
    members: a.hasMany('User'),
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  nationalInfo: a.model({
    name: a.string(),
    states: a.hasMany("WareHouseFacilities"),
    members: a.hasMany('User'),
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  User: a.model({
    id: a.string(),
    name: a.string().required(),
    email: a.email().required(),
    designation: a.string().required(),
    cadre: a.string(),
    partner: a.string(),
    position: a.hasOne('Position'),
    title: a.string(),
    primaryNumber: a.string(),
    secondaryNumber: a.string(),
    microscopy: a.hasOne('TrainingInfo')
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  MicroscopesInfo: a.model({
    source: a.string(),
    status: a.enum(['FUNCTIONAL', 'NON_FUNCTIONAL']),
    dateReceived: a.date()
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  Facility: a.model({
    facility: a.hasOne('WareHouseFacilities'),
    contact: a.hasOne('User'),
    location: a.string(),
    trainings: a.hasMany('TrainingInfo'),
    type: a.string().required(),
    level: a.enum(["PHC_PPM", 'PHC_Govt', 'Secondary_Govt', 'Secondary_PPM', 'Tertiary_Govt', 'Tertiary_PPM']),
    operation: a.enum(['Govt', 'Faith_Based', 'Private', 'NGO', 'Unknow']),
    tbhiv: a.enum(['STANDALONE', 'TBHIV']),
    microscopy: a.enum(['AVAILABLE', 'UNAVAILABLE']),
    microscopyContact: a.hasOne('User'),
    microscopesInfo: a.hasMany('MicroscopesInfo'),
    stockCard: a.hasMany('StockCard')
  })
    .authorization([a.allow.owner(), a.allow.public()]),


  StockCard: a.model({
    product: a.hasOne('Product').required(),
    location: a.hasOne('WareHouseFacilities'),
    receiver: a.string().required(),
    date: a.datetime().required(),
    quantityIssued: a.integer(),
    quantityReceived: a.integer(),
    remarks: a.string(),
    stockBalance: a.integer(),
    lossesAdjustements: a.integer(),
    batchNo: a.string().required(),
    expiryDate: a.date().required()
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  Supply: a.model({
    sender: a.hasOne('User'),
    receiver: a.hasOne('User'),
    products: a.hasMany('DeliveryItem'),
    type: a.string().required(),
    sendDate: a.date().required(),
    status: a.string().required(),
    completeReceivedDate: a.date()
  })
    .authorization([a.allow.owner(), a.allow.public()]),

  ProductBatch: a.model({
    product: a.hasOne('Product'),
    batch: a.string().required(),
    quantity: a.string().required(),
    expiryDate: a.date().required(),
    location: a.hasOne('WareHouseFacilities')
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  DeliveryItem: a.model({
    supply: a.belongsTo('Supply'),
    batchInfo: a.hasOne("ProductBatch"),
    receivedDate: a.date().required(),
  })
    .authorization([a.allow.owner(), a.allow.public()]),


});
export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'apiKey',
    // API Key is used for a.allow.public() rules
    apiKeyAuthorizationMode: {
      expiresInDays: 30,
    },
  },
});
