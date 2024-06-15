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
exports.getUserById = exports.getAllUsers = exports.getUserByUsername = exports.createUser = void 0;
const db_1 = __importDefault(require("../utils/db"));
const createUser = (user) => __awaiter(void 0, void 0, void 0, function* () {
    console.log("entro");
    const connection = yield db_1.default.getConnection();
    try {
        yield connection.execute('INSERT INTO users (username, password, role) VALUES (?, ?, ?)', [user.username, user.password, user.role]);
    }
    finally {
        connection.release();
    }
});
exports.createUser = createUser;
const getUserByUsername = (username) => __awaiter(void 0, void 0, void 0, function* () {
    const connection = yield db_1.default.getConnection();
    try {
        const [rows] = yield connection.execute('SELECT * FROM users WHERE username = ?', [username]);
        const users = rows;
        return users.length ? users[0] : null;
    }
    finally {
        connection.release();
    }
});
exports.getUserByUsername = getUserByUsername;
const getAllUsers = () => __awaiter(void 0, void 0, void 0, function* () {
    const connection = yield db_1.default.getConnection();
    try {
        const [rows] = yield connection.execute('SELECT * FROM users');
        return rows;
    }
    finally {
        connection.release();
    }
});
exports.getAllUsers = getAllUsers;
const getUserById = (id) => __awaiter(void 0, void 0, void 0, function* () {
    const connection = yield db_1.default.getConnection();
    try {
        const [rows] = yield connection.execute('SELECT * FROM users WHERE id = ?', [id]);
        const users = rows;
        return users.length ? users[0] : null;
    }
    finally {
        connection.release();
    }
});
exports.getUserById = getUserById;
