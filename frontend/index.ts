import {Amplify} from "aws-amplify";
import {generateClient} from "aws-amplify/data";
import config from "./amplifyconfiguration.json";
import type {Schema} from './rs';
import {testBasics} from "./test_one";
Amplify.configure(config);


const client = generateClient<Schema>()


async function testQuery(id: string) {
  return client.models.Product.list({
    filter: {
      id: {
        eq: id
      }
    }
  })
}
function subscribeToEvent() {
  client.models.Product.observeQuery().subscribe({
    next: ({items}) => {
      console.log("products updated", items)
    }
  })
  client.models.User.observeQuery().subscribe({
    next: ({items}) => {
      console.log("users updated", items)
    }
  })
}

async function main() {
  // create sender user
  // create receiver user
  // create products to be sent
  // create Facilities
  // create a test delivery between the sender and the receiver
  await testBasics();
}


main().then((_) => {
  process.exit(0);
}).catch((er) => {
  console.log(er);
})