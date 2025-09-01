// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IrenkaToken is ERC20, Ownable {

    // Конструктор для создания токена с заданным начальным количеством
    constructor(uint256 initialSupply) ERC20("Irenka", "INK") {
        _mint(msg.sender, initialSupply);
    }

    // Функция для выпуска дополнительных токенов, доступна только владельцу контракта
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Функция для сжигания токенов, доступна только владельцу контракта
    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }
}
