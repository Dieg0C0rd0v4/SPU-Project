import pandas as pd 
import csv

def  find_opcode(opcode):
    df=pd.read_csv('parser_lookup.csv',dtype=str) #keep leading zeros using dtype=str
    #print(df)
    #parser_dict=df.to_dict("records")
    #print(parser_dict)
    opcodes=df.iloc[:,0]
    binary_opcodes=df.iloc[:,1]
    return (opcodes.str.contains(opcode)).any()
def rewrite_binary(opcode):
    df=pd.read_csv('parser_lookup.csv',dtype=str)#keep leading zeros using dtype=str
    opcodes=df.iloc[:,0]
    binary_opcodes=df.iloc[:,1]
    #print(df)
    print(binary_opcodes)
    lookup_table={} #dictionary
    col_length=len(opcodes)
    for i in range(col_length):
        #print(opcodes[i])
        lookup_table[opcodes[i].strip()]=binary_opcodes[i] #strip to remove whitespace
    #print(lookup_table.keys())
    return lookup_table.get(opcode) #return resulting binary 
#opcode_flag=find_opcode('br')
#new_binary=rewrite_binary("br")
code=open('code.txt', 'r') 
strip_line=""
binary_code_array=[]



while True:
    file_line=code.readline()
    if len(file_line) == 0: #break when there are no more strings 
         break
    split_line=file_line.split() # separate keyword from registers  
    print(split_line)
    print(split_line[0])
    new_binary=rewrite_binary(split_line[0])
    new_line=new_binary+' '+split_line[1]
    print(new_line)
    binary_code_array.append(new_line) #add line to array 
    
code.close()
with open('binary_code.txt','w') as binary_code:
    for binary in binary_code_array:
        binary_code.write(binary)
        binary_code.write('\n')
binary_code.close()
