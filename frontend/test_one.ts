import {getAllUserSupplies} from "./getter";
import type {Schema} from './rs';


export async function testBasics() {
  type userType = Schema['User']

  // user 1 is a facility employee
  const abuadcontact =
  {
    name: "User one",
    email: "user1@gmail.com",
    id: "NC/SW/EK/ADO/ABUAD/1",
    designation: "LGA_FACILITY",
    primaryNumber: "1987654321",
    secondaryNumber: "01234567891",
    microscopy: {
      month: "3",
      year: "2003",
      status: "TRAINED",
      type: 'HCT',
    },
    cadre: "NURSE",
  }

  // user2 is the lga user
  const user2 =
  {
    name: "User two",
    email: "user2@gmail.com",
    id: "NC/SW/EK/ADO/1",
    designation: "LGA",
    primaryNumber: "1987654321",
    secondaryNumber: "01234567891"
  }
  // user 3 is a state warehouse
  const user3 =
  {
    name: "User three",
    email: "user3@gmail.com",
    id: "NC/SW/EK/1",
    designation: "STATE_WAREHOUSE",
    primaryNumber: "1987654321",
    secondaryNumber: "01234567891"
  }
  // user 4 is a zonal warehouse
  const user4 =
  {
    name: "User four",
    email: "user4@gmail.com",
    id: "NC/SW/1",
    designation: "ZONAL_WAREHOUSE",
    primaryNumber: "1987654321",
    secondaryNumber: "01234567891"
  }
  // user 5 is a national warehouse
  const user5 =
  {
    name: "User five",
    email: "user5@gmail.com",
    id: "NC/1",
    designation: "NATIONAL_WAREHOUSE",
    primaryNumber: "1987654321",
    secondaryNumber: "01234567891"
  }
  // user 6 is a microscopy contact
  const microscopyContact =
  {
    name: "Microscopuy guy",
    email: "micro@gmail.com",
    id: "NC/SW/EK/ABUAD/2",
    designation: "LGA_FACILITY",
    primaryNumber: "1987654321",
    secondaryNumber: "01234567891",
    microscopy: {
      month: "3",
      year: "2003",
      status: "TRAINED",
      type: 'AFB_Microscopy',
    },
  }
  // user 7 is a ado warehouse contact
  const microscopyContact =
  {
    name: "Ado warehouse guy",
    email: "adowarehouse@gmail.com",
    id: "NC/SW/EK/ADO",
    designation: "LGA_WAREHOUSE",
    primaryNumber: "1987654321",
    facility
    secondaryNumber: "01234567891",
  }

  const product1 =
    {name: "Patient Kit", description: "Kit for treating TB", id: "product1"}
  const product2 =
    {name: "Patient Kit II", description: "Kit for treating TB with kit 2", id: "product2"}
  const product3 =
    {name: "Product IV", description: "Description for product 3", id: "product3"}


  const abuadFacility = {
    facility: {
      type: 'FACILITY',
      name: "ABUAD",
      id: "abuad1"
    },
    facilityContactId: abuadcontact.id,
    facilityMicroscopyContactId: microscopyContact.id,
    location: "ABUAD",
    trainings: [
      {
        month: "1",
        year: "2003",
        status: 'TRAINED',
        type: 'GHW'
      },
      {
        month: "1",
        year: "2003",
        status: 'TRAINED',
        type: 'TBHIV'
      },
    ],
    level: "PHC_PPM",
    operation: 'Private',
    tbhiv: 'STANDALONE',
    microscopy: 'AVAILABLE',
    microscopesInfo: [
      {
        source: "PRIVATE",
        status: 'FUNCTIONAL',
        dateReceived: "11-23-2004"
      },
      {
        source: "PRIVATE",
        status: 'FUNCTIONAL',
        dateReceived: "11-23-2004"
      },
    ],
    stockCard: []
  }
  const adoWarehouse = {
    facility: {
      type: 'WAREHOUSE',
      name: "ADO WAREHOUSE",
      id: "ado1"
    },
    facilityContactId: abuadcontact.id,
    facilityMicroscopyContactId: microscopyContact.id,
    location: "ABUAD",
    trainings: [
      {
        month: "1",
        year: "2003",
        status: 'TRAINED',
        type: 'GHW'
      },
      {
        month: "1",
        year: "2003",
        status: 'TRAINED',
        type: 'TBHIV'
      },
    ],
    level: "PHC_PPM",
    operation: 'Private',
    tbhiv: 'STANDALONE',
    microscopy: 'AVAILABLE',
    microscopesInfo: [
      {
        source: "PRIVATE",
        status: 'FUNCTIONAL',
        dateReceived: "11-23-2004"
      },
      {
        source: "PRIVATE",
        status: 'FUNCTIONAL',
        dateReceived: "11-23-2004"
      },
    ],
    stockCard: []
  }
  // supply of goods from user2 at zonal facility to user1 at LGA facility
  const newSupplyOfGoods = {
    id: "supply 1",
    sender: user2,
    receiver: user1,
    type: 'NEW_ITEMS',
    sendDate: '2024-03-03',
    status: 'SENT',
  }

  // get all supplies meant for the receiver




  // await createNewSupply(newSupplyOfGoods);
  // await createDeliveryItem(newSupplyOfGoods, item1);
  // await getItems();
  // await getUsers();
  // await getSuuplies();
  // await getDeliveryItems();

  await getAllUserSupplies(user1.id);
  await getAllUserSupplies(user2.id);
}




// create facility
// create produts
// create 10 people
// create state
// create lga
// create zone
// create shippment from national to zonal
// craete shipppments from zonal to state warehouse
// create shpippments from state to facility
// create sideways shippment from facility to next facility
// view stockcard for all
// generate quarterly form
// generate queries form 
// view drugs statistics
// view location statistics

