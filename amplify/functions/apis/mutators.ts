import {Amplify} from "aws-amplify";
import {generateClient} from "aws-amplify/data";
import config from "../../../amplifyconfiguration.json";
import type {Schema} from '../../data/resource';

Amplify.configure(config);

const client = generateClient<Schema>()

export async function assignUserToFacility(facilityId:string, userId:string, microscope:boolean) {
  var newf;
  if(!microscope)
  {newf={
    id: facilityId,
    facilityContactId: userId
  }}
  else {
    newf = {
      
      id: facilityId,
      // facilityMicroscopyContactId: userId
    }
  }
  await client.models.Facility.update(newf);
}
