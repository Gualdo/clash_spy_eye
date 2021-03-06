//
//  Constants.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 16/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit

struct ServerData
{
    static let apiUrl = "https://api.clashofclans.com/"
    static let apiVersion = "v1/"
    static let clanNameRequest = "clans"
    static let clanNameRequestParameter = "name"
    static let ip200Token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImU0M2U2N2QzLWMyZWItNDdkYy1hZTdhLWUxYWQzN2UwMTY2MyIsImlhdCI6MTUxMDA4ODgzMCwic3ViIjoiZGV2ZWxvcGVyLzRlNWMzNDcxLWYxYjgtOWQ5Ny04MGRmLWY3ZTNjYzBjYTFkYiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjIwMC43NC4yMDEuMjUwIl0sInR5cGUiOiJjbGllbnQifV19.-Dai73MLU9qX7T1s1IpftUkUY-hZQtYTYvZGA7kFVwMQMJJgJYjIlK35HEuMbZ4UwZ3KIC0w6EzQdb-Fd3qoPg"
    static let ip201Token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImE0MDI5NTdjLWFiNTItNDYyNi1iM2I5LTQ1NTFjNjc4Mzc1NiIsImlhdCI6MTUwOTczNTc1Mywic3ViIjoiZGV2ZWxvcGVyLzRlNWMzNDcxLWYxYjgtOWQ5Ny04MGRmLWY3ZTNjYzBjYTFkYiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjY0LjIxMS42Ni4zMCIsIjIwMS4yMjIuMS4yMzYiXSwidHlwZSI6ImNsaWVudCJ9XX0.BzbGeJSkIJMNVi3A1O4DzFbzr26zuVFSxDg0Gfs_UEMPqQx0ALBw0j6-hLaHltzfvBnW8XgX4I8vJlnH3-BPRg"
}

struct RequestInfo
{
    static var clanName = String()
    static var clanTag = String()
}
