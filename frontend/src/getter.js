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
exports.getDeliveryItem = exports.getAllUserSupplies = exports.getDeliveryItems = exports.getSuuplies = exports.getFacilities = exports.getUsers = exports.getItems = void 0;
const aws_amplify_1 = require("aws-amplify");
const data_1 = require("aws-amplify/data");
const amplifyconfiguration_json_1 = __importDefault(require("./amplifyconfiguration.json"));
aws_amplify_1.Amplify.configure(amplifyconfiguration_json_1.default);
const client = (0, data_1.generateClient)();
function getItems() {
    return __awaiter(this, void 0, void 0, function* () {
        const { errors, data } = yield client.models.Item.list();
        console.log('items are: ');
        console.log(data);
        return data;
    });
}
exports.getItems = getItems;
function getUsers() {
    return __awaiter(this, void 0, void 0, function* () {
        const { errors, data } = yield client.models.User.list();
        console.log('users are: ');
        console.log(data);
        return data;
    });
}
exports.getUsers = getUsers;
function getFacilities() {
    return __awaiter(this, void 0, void 0, function* () {
        const { errors, data } = yield client.models.Facility.list();
        console.log('facilities are: ');
        console.log(data);
        return data;
    });
}
exports.getFacilities = getFacilities;
function getSuuplies() {
    return __awaiter(this, void 0, void 0, function* () {
        const { errors, data } = yield client.models.Supply.list();
        console.log('Supplies are: ');
        console.log(data);
        console.log('the sender is:', yield data[0].sender());
        console.log('the receiver is:', yield data[0].receiver());
        console.log('the items are:', yield data[0].items());
        return data;
    });
}
exports.getSuuplies = getSuuplies;
function getDeliveryItems() {
    return __awaiter(this, void 0, void 0, function* () {
        const { errors, data } = yield client.models.DeliveryItem.list();
        console.log('DeliveryItems are: ');
        console.log(data);
        return data;
    });
}
exports.getDeliveryItems = getDeliveryItems;
function getAllUserSupplies(receiverId) {
    return __awaiter(this, void 0, void 0, function* () {
        const { errors, data } = yield client.models.Supply.list({
            filter: {
                supplyReceiverId: {
                    eq: receiverId
                }
            }
        });
        console.log("User's data is: ", data);
    });
}
exports.getAllUserSupplies = getAllUserSupplies;
function getDeliveryItem(itemId) {
    return __awaiter(this, void 0, void 0, function* () {
        console.log("The particular item in question has\nbeen retreived with the following details");
        return yield client.models.DeliveryItem.get({ id: itemId });
    });
}
exports.getDeliveryItem = getDeliveryItem;
