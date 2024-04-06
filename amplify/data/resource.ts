import {a, defineData, type ClientSchema, defineFunction} from '@aws-amplify/backend';

const schema = a.schema({
  Product: a
    .model({
      name: a.string(),
      description: a.string(),
    })
    .authorization([a.allow.owner(), a.allow.public()]),
  TrainingInfo: a.model({
   date: a.date(),
    status: a.enum(['TRAINED', 'UNTRAINED']),
    type: a.enum(['GHW', 'TBHIV', 'LMIS', 'HCT', 'AFB_Microscopy']),
    facility: a.belongsTo('Facility'),
  }).authorization([a.allow.owner(), a.allow.public()]),
  
  MicroscopistTraining: a.model({
    date: a.date(),
    status: a.enum(['TRAINED', 'UNTRAINED']),
    type: a.string().required(),
    user: a.belongsTo('User'),
  })
  .authorization([a.allow.owner(), a.allow.public()]),
  

  User: a.model({
    id: a.string(),
    name: a.string().required(),
    email: a.email().required(),
    designation: a.string().required(),
    cadre: a.string(),
    partner: a.string(),
    state: a.string(),
    zone: a.string(),
    lga:a.string(),
    title: a.string(),
    primaryNumber: a.string(),
    facility: a.hasOne('Facility'),
    secondaryNumber: a.string(),
   microscopy: a.hasOne('MicroscopistTraining')
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  MicroscopesInfo: a.model({
    facility: a.belongsTo("Facility"),
    source: a.string(),
    status: a.enum(['FUNCTIONAL', 'NON_FUNCTIONAL']),
    dateReceived: a.date()
  })
    .authorization([a.allow.owner(), a.allow.public()]),
  Facility: a.model({
    type: a.enum(['FACILITY', 'WAREHOUSE']),
    name: a.string().required(),
    id: a.string().required(),
    address:a.string().required(),
    contact: a.belongsTo('User'),
    state: a.string(),
    zone: a.string(),
    lga: a.string(),
    trainings: a.hasMany('TrainingInfo'),
    level: a.enum(["PHC_PPM", 'PHC_Govt', 'Secondary_Govt', 'Secondary_PPM', 'Tertiary_Govt', 'Tertiary_PPM']),
    operation: a.enum(['Govt', 'Faith_Based', 'Private', 'NGO', 'Unknow']),
    tbhiv: a.enum(['STANDALONE', 'TBHIV']),
    microscopy: a.enum(['AVAILABLE', 'UNAVAILABLE']),
    microscopyContact: a.belongsTo('User'),
    microscopesInfo: a.hasMany('MicroscopesInfo'),
    stockCard: a.hasMany('StockCard'),
    inventorySummary: a.hasOne('Inventory'),
    meData: a.hasMany("MEData")
  })
    .authorization([a.allow.owner(), a.allow.public()]),
    
    PQuantity: a.model({
      product:a.hasOne('Product').required(),
      quantity: a.integer().required(),
      batchInfo: a.hasOne("ProductBatch").required(),
      inventory: a.belongsTo("Inventory")
    })
    .authorization([a.allow.owner(), a.allow.public()]),
  Inventory: a.model({
    facility: a.belongsTo('Facility'),
    items: a.hasMany("PQuantity")
  })
  .authorization([a.allow.owner(), a.allow.public()]),
  StockCard: a.model({
    product: a.hasOne('Product').required(),
    facility: a.belongsTo('Facility'),
    receiver: a.string().required(),
    date: a.datetime().required(),
    quantityIssued: a.integer(),
    quantityReceived: a.integer(),
    remarks: a.string(),
    stockBalance: a.integer(),
    type: a.string(),
    lossesAdjustements: a.integer(),
    batchNo: a.string().required(),
    expiryDate: a.date().required()
  })
    .authorization([a.allow.owner(), a.allow.public()]),
    QForm: a.model({
      quarter: a.string(),
      user: a.hasOne('User'),
      facility: a.hasOne('Facility'), 
      productInfo: a.hasOne('Product'),
      physicalInventory: a.integer().required()      
    })
    .authorization([a.allow.owner(), a.allow.public()]),
    
  Supply: a.model({
    sender: a.hasOne('Facility'),
    receiver: a.hasOne('Facility'),
    products: a.hasMany('ProductBatch'),
    type: a.string().required(),
    sendDate: a.date().required(),
    status: a.string().required(),
    completeReceivedDate: a.date()
  })
    .authorization([a.allow.owner(), a.allow.public()]),

ProductBatch: a.model({
    pqInfo: a.belongsTo("PQuantity"),
    product: a.hasOne('Product'),
    batch: a.string().required(),
    quantity: a.string().required(),
    expiryDate: a.date().required(),
    supply: a.belongsTo('Supply')
  })
    .authorization([a.allow.owner(), a.allow.public()]),
    MEData: a.model({
      facility: a.belongsTo("Facility"),
      date: a.date().required(),
      numberOfCases: a.integer().required(),
    }) 
    .authorization([a.allow.owner(), a.allow.public()]),
    
    Discrepancy: a.model({
      supply: a.hasOne('Supply'),
      sent: a.integer(),
      received:a.integer()
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



