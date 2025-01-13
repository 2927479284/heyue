// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract ContractStructure {
    uint256 public balance;


    // 定义事件
    event BalanceAdded(uint256 oldValue,uint256 incre);

    // 合约函数的修饰器（自定义）
    // 传入的值的范围进行限制
    modifier IncrementRange(uint256 _incre){
        // 修饰器是对函数的输入输出条件进行约束
        // 类似 java 面向切面拦截 反射机制
        // 提示只能写英文
        // 输入的值必须大于100
        require(_incre > 100, "too small!!!");
        _;// 执行被修饰函数本身
    }


    /** 获取变量的数据 **/
    function balance1() internal view returns(uint256){
        return balance;
    }


    /** 对变量进行增加操作 **/
    function addBalance(uint256 _incre) external IncrementRange(_incre) {
        uint256 old = balance;
        balance += _incre;
        // 触发事件
        emit BalanceAdded(old, _incre);
    }

}