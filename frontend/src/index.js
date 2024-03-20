"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const aws_amplify_1 = require("aws-amplify");
const data_1 = require("aws-amplify/data");
const amplifyconfiguration_json_1 = __importDefault(require("./amplifyconfiguration.json"));
const test_one_1 = require("./test_one");
aws_amplify_1.Amplify.configure(amplifyconfiguration_json_1.default);
const client = (0, data_1.generateClient)();
function testQuery(id) {
    return __awaiter(this, void 0, void 0, function* () {
        return client.models.Product.list({
            filter: {
                id: {
                    eq: id
                }
            }
        });
    });
}
function subscribeToEvent() {
    client.models.Product.observeQuery().subscribe({
        next: ({ items }) => {
            console.log("products updated", items);
        }
    });
    client.models.User.observeQuery().subscribe({
        next: ({ items }) => {
            console.log("users updated", items);
        }
    });
}
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        // create sender user
        // create receiver user
        // create products to be sent
        // create Facilities
        // create a test delivery between the sender and the receiver
        yield (0, test_one_1.testBasics)();
    });
}
main().then((_) => {
    process.exit(0);
}).catch((er) => {
    console.log(er);
});
