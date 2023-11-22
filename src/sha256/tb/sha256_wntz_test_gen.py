#/usr/local/bin/python3
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import os
import subprocess
import random

def generate_expected_wntz_digest():
    f = open("sha256_test_vector.txt", "r")
    g = open("expected_wntz_digest.txt", "w")
    h = open("expected_wntz_digests_all.txt", "a")
    
    block_str = ""
    digest_str = ""

    for line in f:
        if(line[0:8] == "BLOCK = "):
            block_str = line.strip()[8:]   

    #print(block_str) 
    block_str = '9e14f94af2b142af655bb024501ff00700000000000009aad490eb72b80d40b39ef87a17f53b21f0345a6aaebccb6b'

    #Generate digest using OpenSSL HMAC SHA384
    command = 'echo '+block_str+' | xxd -r -p | openssl dgst -sha256'
    digest = subprocess.check_output(command, shell=True)
    digest_str = str(digest)

    #Chomp extra chars at beginning and end if python 3.6.8 is loaded
    if digest_str[1] == "'":
        digest_str = digest_str[11:-3]
    else:
        digest_str = digest_str.rstrip()
        digest_str = digest_str[9:]

    g.write('DIGEST 0 = '+digest_str+'\n')
    # print(digest_str)
    digest_str = digest_str[0:48]
    # print(digest_str)

    #Calculate chain of hashes for wntz
    for i in range(1):
        #Generate digest using OpenSSL HMAC SHA384
        #print(str(format(i+1,'x')))
        if i < 20:
            print(digest_str)
        digest_str = '61626380000000000000000000000000000000000000'+str(format(i+1,'02x'))+digest_str
        command = 'echo '+digest_str+' | xxd -r -p | openssl dgst -sha256'
        digest = subprocess.check_output(command, shell=True)
        digest_str = str(digest)

        #Chomp extra chars at beginning and end if python 3.6.8 is loaded
        if digest_str[1] == "'":
            digest_str = digest_str[11:-3]
        else:
            digest_str = digest_str.rstrip()
            digest_str = digest_str[9:]

        digest_str = digest_str[0:48]
        # print(digest_str)

    g.write('DIGEST = '+digest_str+'\n')
    h.write('DIGEST = '+digest_str+'\n')
    h.write("------------------------\n")

    


    f.close()
    g.close()
    h.close()

def main():
    generate_expected_wntz_digest()

main()
