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
exports.createDeliveryItem = exports.createNewSupply = exports.createNewItem = exports.createNewFacility = exports.createUser = void 0;
const aws_amplify_1 = require("aws-amplify");
const data_1 = require("aws-amplify/data");
const amplifyconfiguration_json_1 = __importDefault(require("./amplifyconfiguration.json"));
aws_amplify_1.Amplify.configure(amplifyconfiguration_json_1.default);
const client = (0, data_1.generateClient)();
function createUser(user) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            yield client.models.User.create(user);
            console.log('new user created');
            return true;
        }
        catch (error) {
            console.log(error);
            return false;
        }
    });
}
exports.createUser = createUser;
function createNewFacility(facility) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            yield client.models.User.create({});
            yield client.models.Facility.create(facility);
            console.log('new facility created');
            return true;
        }
        catch (error) {
            console.log(error);
            return false;
        }
    });
}
exports.createNewFacility = createNewFacility;
function createNewItem(product) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            yield client.models.Product.create(product);
            console.log('new Product created');
            return true;
        }
        catch (error) {
            console.log(error);
            return false;
        }
    });
}
exports.createNewItem = createNewItem;
function createNewSupply(supply) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const { data: supplyModel, errors } = yield client.models.Supply.create(supply);
            console.log(supplyModel);
            console.log(errors);
            console.log('new Supply created');
            return supplyModel;
        }
        catch (error) {
            console.log(error);
            return false;
        }
    });
}
exports.createNewSupply = createNewSupply;
function createDeliveryItem(supply, item) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const status = yield client.models.DeliveryItem.create({
                id: "del 44421",
                supply: supply,
                product: item,
                quantity: 4,
                expiryDate: '2024-03-03',
                receivedDate: '2024-03-03'
            });
            console.log(status.errors);
            console.log(status.data);
            console.log('new DeliveryItem added');
            return true;
        }
        catch (error) {
            console.log(error);
            return false;
        }
    });
}
exports.createDeliveryItem = createDeliveryItem;
