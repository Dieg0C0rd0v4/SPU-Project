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
    #print(binary_opcodes)
    lookup_table={} #dictionary
    col_length=len(opcodes)
    for i in range(col_length):
        #print(opcodes[i])
        lookup_table[opcodes[i].strip()]=binary_opcodes[i] #strip to remove whitespace
    #print(lookup_table.keys())
    return lookup_table.get(opcode) #return resulting binary
def get_op_length(opcode):
    df=pd.read_csv('parser_lookup.csv',dtype=str)#keep leading zeros using dtype=str
    opcodes=df.iloc[:,0]
    binary_opcodes=df.iloc[:,1]
    #print(df)
    #print(binary_opcodes)
    lookup_table={} #dictionary
    col_length=len(opcodes)
    for i in range(col_length):
        #print(opcodes[i])
        lookup_table[opcodes[i].strip()]=binary_opcodes[i] #strip to remove whitespace
    #print(lookup_table.keys())
    return len(lookup_table.get(opcode)) #return resulting binary

#opcode_flag=find_opcode('br')
#new_binary=rewrite_binary("br")
code=open('code.txt', 'r') 
strip_line=""
binary_code_array=[]
new_arg=""
new_binary=""
def get_format_size(opcode_length,binary_number,current_arg):
    #opcode_length=len(opcode)
    #print(opcode_length)
    padded_binary=binary_number
    RR_or_RI7=[7,7,7] #six instruction formats, RR and RI7 are the same
    #size 11
    
    RRR=[7,7,7,7]
    #size 4
    
    R_I10=[10,7,7]
    #size 8
    
    R_I16=[16,7]
    #size 9
    
    R_I18=[18,7]
    #size 7
    if(opcode_length==11):
        padded_binary=binary_number.zfill(RR_or_RI7[current_arg])
        #print("current_arg_size is" +str(RR_or_RI7[current_arg]))
    elif(opcode_length==4):
        padded_binary=binary_number.zfill(RRR[current_arg])
    elif(opcode_length==8):
        padded_binary=binary_number.zfill(R_I10[current_arg])
    elif(opcode_length==9):
        padded_binary=binary_number.zfill(R_I16[current_arg])
    elif(opcode_length==7):
        padded_binary=binary_number.zfill(R_I18[current_arg])
    print(padded_binary)
    return padded_binary  
        
while True:
    file_line=code.readline()
    if len(file_line) == 0: #break when there are no more strings 
         break
    split_line=file_line.split() # separate keyword from registers  
    print(split_line)
    #print("Opcode is "+split_line[0])
    new_binary=rewrite_binary(split_line[0]) #opcode
    #print("New binary is "+new_binary)
    opcode_size=get_op_length(split_line[0])
    print(split_line[0]+" opcode's size is "+str(opcode_size))
    reg_and_imm=split_line[1].split(',') #remove commas
    print(reg_and_imm)
    print("The number of args are "+str(len(reg_and_imm)))
    for i in range(len(reg_and_imm)):
        arg=reg_and_imm[i]
        print("i is "+str(i))
        #print(bin(int(arg)))
        binary_arg=bin(int(arg))[2:]
        binary_arg=get_format_size(opcode_size,binary_arg,i)
        #print(binary_arg)
        new_arg=new_arg+binary_arg
    print(new_arg)
    new_line=new_binary+new_arg
    print("the new line character length is "+str(len(new_line)))
    #print(new_line)
    new_arg="" #clear new_arg `
    binary_code_array.append(new_line) #add line to array 
    
code.close()
with open('binary_code.txt','w') as binary_code:
    for binary in binary_code_array:
        binary_code.write(binary)
        binary_code.write('\n')
binary_code.close()
