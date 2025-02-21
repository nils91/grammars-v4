/*
BSD License

Copyright (c) 2018, Tom Everett
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of Tom Everett nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

grammar muddb;

db
   : room* END
   ;

room
   : roomno name description location contents exits next key fail_message succ_message ofail osuccess owner pennies flags password
   ;

roomno
   : STRING EOL
   ;

name
   : string
   ;

description
   : string
   ;

location
   : ref
   ;

contents
   : ref
   ;

exits
   : ref
   ;

next
   : ref
   ;

key
   : bool
   ;

fail_message
   : string
   ;

succ_message
   : string
   ;

ofail
   : string
   ;

osuccess
   : string
   ;

owner
   : ref
   ;

pennies
   : ref
   ;

flags
   : ref
   ;

password
   : string
   ;

string
   : STRING? EOL
   ;

ref
   : NUM? EOL
   ;

bool
   : NUM? EOL
   ;


END
   : '***END OF DUMP***'
   ;


NUM
   : '-'? [0-9] +
   ;


STRING
   : [a-zA-Z0-9,;:'.* \t!<>{}()[\]@?=_"`+-/#] +
   ;


EOL
   : '\r'? '\n'
   ;
