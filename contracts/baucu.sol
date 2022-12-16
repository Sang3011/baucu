pragma solidity >=0.4.2;

contract baucu {
    // Model a Vote
    // mapping(uint => string) hash; //hash thông tin
    // mapping(uint => string) hashimage;
    // mapping(uint => Candidate[]) candidates; //mảng ứng cử viên
    // mapping(uint => uint) number; //so luong bau chon
    
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        string gioitinh;
        uint tuoi;
        string tomtat;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    constructor() public {
        candidatesCount = 0;
        
    }

    function addCandidate (string memory _name, string memory _gioitinh, uint _tuoi, string memory _tomtat) public {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,_gioitinh,_tuoi,_tomtat,0);
    }

    function vote (uint _a, uint _b, uint _c, uint _d, uint _e) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        // require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        if (_a==1)candidates[1].voteCount ++;
        if (_b==2) candidates[2].voteCount ++;
        if (_c==3) candidates[3].voteCount ++;
        if (_d==4) candidates[4].voteCount ++;
        if (_e==5) candidates[5].voteCount ++;
        

        // trigger voted event
        emit votedEvent(_a);
    }

}
