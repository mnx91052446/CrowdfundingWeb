// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//開啟 ABI V2 編碼器
pragma experimental ABIEncoderV2;

//合約名稱記得要使用大寫
contract DreamCyut {
    mapping (string => Project) public projects;

    uint public do_count = 0;
    
    mapping (uint => Donate_record) public donate_records;

    Donate_record[] pj_List;
    mapping (string => Donate_record[]) public records;


    event NewProject (string name, string teenager);
    event NewDonate (string name, string sponsor, string teenager, uint amount);

    struct Project {
        string pj_name;
        string teenger;
        uint start_time;
        uint end_time;
    }

    struct Donate_record {
        uint id;
        string pj_name;
        string sponsor;
        string teenager;
        uint amount;
        uint date;
        string feeback;
    }
    //新增專案
    function create_project(string memory pj_name, string memory teenager, uint start_time, uint end_time) public {
        projects[pj_name] = Project(pj_name, teenager, start_time, end_time);
        emit NewProject(pj_name, teenager);
    }
    //贊助金額
    function donate(string memory pj_name, string memory sponsor, string memory teenager, uint amount, string memory feeback) public {
        pj_List = records[pj_name];
        Donate_record memory  donate_record = Donate_record(do_count, pj_name, sponsor, teenager, amount, block.timestamp, feeback);
        pj_List.push(donate_record);
        records[pj_name] = pj_List;
        delete pj_List;
        do_count += 1;
        emit NewDonate(pj_name, sponsor, teenager, amount);
    }

    function project_detail(string memory pj_name) public view returns(Project memory) {
        return projects[pj_name];
    }

    function get_do_record(string memory pj_name) public view returns(Donate_record[] memory) {
        return records[pj_name];
    }
    //測試用函式
    function testCode() public pure returns (string memory) {
        return 'success!';
    }

    
}
