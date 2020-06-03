import sys
from collections import OrderedDict

# Usage : python3 file=XX.txt table=pf_field
# Usage : you can remove last column name in data file
# Usage : then query will be created with (n-1) columns
if __name__=='__main__':

    args = sys.argv[1:];
    attr = OrderedDict();

    for argument in args:
        tmp = argument.split("=");
        attr[tmp[0]] = tmp[1];

    filename = attr["file"];
    tablename = attr["table"];

    fileReader = open(filename, "r");
    fileWriter = open(tablename+".txt", "w");

    columns = fileReader.readline().split();

    query = "insert into " + tablename + "("
    for tmp in columns:
        query = query + tmp + ",";
    query = query[:-1] + ") values(";
    while(True):
        line = fileReader.readline();
        if not line: break;
       
        completeQuery = query;
        values = line.split();
        for idx in range(len(columns)):
            if values[idx].isdigit():
                completeQuery = completeQuery + values[idx] + ",";
            else:
                completeQuery = completeQuery + "\"" + values[idx] + "\"" + ","
        completeQuery = completeQuery[:-1] + ");";
        fileWriter.write(completeQuery+"\n");

    fileReader.close();
    fileWriter.close();




    


