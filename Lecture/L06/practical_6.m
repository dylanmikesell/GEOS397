clear all
close all
clc

% Lecture 06 - Practical

% Subject: File I/O, user I/O (command line and GUI), TRY-CATCH

%% the GUI version of data importing

% have to click "Import Data" button the HOME ribbon. 

%% if we know the file name we can use that

data = importdata('studentList.xlsx'); %  will separate text and numbers under a structure


%% Let's breifly discuss a structure

%% a structure is a variable with many variables inside of it

data

%% you can access those other data (called 'Fields') using the .

data.textdata

%% you can also just gets part of that field

data.textdata(1:4) % (rows 1 to 4, first column)

%% don't forget it might have multiple columns

data.textdata(1:4,:) % (rows 1 to 4, all columns)

%% If we know what we want to load we just use xlsread()

numbers = xlsread('studentList.xlsx'); % this just reads numbers, not text

%%

[numbers,text,raw] = xlsread('studentList.xlsx');

%% what if we have multiple worksheets

[numbers,text,raw] = xlsread('studentList.xlsx','GEOS397'); 
% we can tell MATLAB which worksheet

%% what if we do not want to load all students

xlRange = 'B2:C3';
[numbers,text,raw] = xlsread('studentList.xlsx','GEOS397',xlRange); 

%% Even more examples at the Mathworks.com site

% http://www.mathworks.com/help/matlab/ref/xlsread.html

%% we can also read the common "csv" file (comma separated variable)

% we can read almost any ASCII text file; CSV is just a nice format to
% save data.

% http://www.mathworks.com/help/matlab/text-files.html

data = csvread('studentList.csv'); 
% this should give an error because csvread only works with number, not strings 

% check the csvread webpage for more information
% http://www.mathworks.com/help/matlab/ref/csvread.html

%% what if you have space or tab separated (a.k.a. delimited) text files

% you can use dlmread('studentList.csv','delimiter',';')

% be aware it also only works for numbers, not strings
% http://www.mathworks.com/help/matlab/ref/dlmread.html

%% So what if we have strings and numbers?

% This is where we use textscan() and we tell MATLAB the format

fid = fopen( 'studentList.txt', 'r' ); % 'r' means read-mode, not write-mode (you can leave blank)
C   = textscan( fid, '%d%s%s' ); % this tells MATLAB 1 integer, and 2 strings column by column
fclose( fid );

% What is fopen for?
% http://www.mathworks.com/help/matlab/ref/fopen.html

C % look at the data type returned

%% Let's look at what happened with textscan

% C is a cell variable. This means we access elements with {}, instead of
% ()

C(1) % should give an error

%% So we need to use C{1} instead to access the cell elements

C{1}

%% What if we change the format we give MATLAB

fid = fopen( 'studentList.txt', 'r' ); % 'r' means read-mode, not write-mode (you can leave blank)
C   = textscan( fid, '%f%s%s' ); % this tells MATLAB 1 float, and 2 strings column by column
fclose( fid );

C

% now C{1} should be doubles instead of int32

%% So why would we want to use textscan or something else besides importdata??

% When you have a standard data file format, it is quicker to write you own
% "read" function rather than use importdata each time. Remember we want to
% automate things to remove the user time required to process data.

% Let's try a more complicated file

fid = fopen('ALL_data_combined_FINAL.csv');
C = textscan(fid,'%s%s%s%s%f%f%f%f%f%f','HeaderLines',1,'Delimiter', ',', 'TreatAsEmpty', '?', 'EmptyValue', NaN);
fclose(fid);

% Now we just extract the data we want from the textscan structure C
latData  = C{5};
lonData  = C{6};
depData  = C{7};
mudData  = C{8};
sandData = C{9};
gravData = C{10};

%% What if I don't have ASCII text data, but binary data

% Then you need what is term low-level I/O tools.
% http://www.mathworks.com/help/matlab/low-level-file-i-o.html

% You again have to tell MATLAB how to read the bytes from the file.
% 
% "An ASCII file is a binary file that stores ASCII codes. Recall that an
% ASCII code is a 7-bit code stored in a byte. To be more specific, there
% are 128 different ASCII codes, which means that only 7 bits are needed to
% represent an ASCII character.   
% However, since the minimum workable size is 1 byte, those 7 bits are the
% low 7 bits of any byte. The most significant bit is 0. That means, in any
% ASCII file, you're wasting 1/8 of the bits. In particular, the most
% significant bit of each byte is not being used.   
% 
% Although ASCII files are binary files, some people treat them as
% different kinds of files. I like to think of ASCII files as special kinds
% of binary files. They're binary files where each byte is written in ASCII
% code.   
% 
% A full, general binary file has no such restrictions. Any of the 256 bit
% patterns can be used in any byte of a binary file. 
% 
% We work with binary files all the time. Executables, object files, image
% files, sound files, and many file formats are binary files. What makes
% them binary is merely the fact that each byte of a binary file can be one
% of 256 bit patterns. They're not restricted to the ASCII codes."   
% 
% Read more here: https://www.cs.umd.edu/class/sum2003/cmsc311/Notes/BitOp/asciiBin.html
% or search the web.

% People often use binary because it takes less space than an ASCII format
% to store the same data. The problem is that that humans read binary if
% you open the file in a text editor.

%% Let's look at MATLAB's built in data format

clear all

% MATLAB uses the *.mat file extension to store data. It's a binary file
% format so it is small.

% save('studentList.mat','data') % I already save this data structure

% remember we had 
% 1) data.data (the number of students save as numbers)
% 2) data.textdata (the name of students saved a strings)

load('studentList.mat')

% We can save multiple variables just by using 
% save(filename,'variable1','variable2','variable3',etc)
% Note the '' around variable names. That is a requirement!

% More here: http://www.mathworks.com/help/matlab/ref/save.html?searchHighlight=save

% If you want to save the entire workspace (i.e. all current variables) you
% just use save(filename) and MATLAB saves everything. You can then use
% load(filename) to load everything back in the workspace.

save('path/filename.mat')

%% For large data sets, there is the NetCDF format.

% MATLAB has a netcdf reader if you need. This is beyond the scope of this
% course, but be aware that this capability exists.
%
% http://www.mathworks.com/help/matlab/ref/netcdf.html

%% Let' look at try-catch statements and then incorporate into file I/O
clc

a = notaFunction( 5, 6) % should give error

%% let's try to circumvent the error

try
    a = notaFunction( 5, 6); % will not work
catch % so we catch the error and instead do something else (e.g. set a=0)
    warning('Problem using function.  Assigning a value of 0.');
    a = 0;
end

a


%% Let's try our own now
clc
clear all

filename = 'StudentsList.mat';

try
    load( filename );
catch
    warning('File not found or does not exist. Check path or filename.')
    disp('Trying studentList.mat instead');
    filename = 'studentList.mat';
    load( filename );
end

%% You can use the try-catch statement to handle errors and make them more explicit

% For example, let's catenate two vectors

A = rand(3); % is a 3 element array with random numbers between 0-1
B = ones(5); % is a 5 element array of ones

C = [A; B]; % this should give an error

%% Let's try to run "C = [A; B];" and write a 'catch' that is more specific
clc

try
    
   C = [A; B]; % we are trying it again 

catch ME % ME is the structure that contains the error message
    
    if ( strcmp(ME.identifier,'MATLAB:catenate:dimensionMismatch') )
      
        msg = ['Dimension mismatch occurred: First argument has ', ...
            num2str(size(A,2)),' columns while second has ', ...
            num2str(size(B,2)),' columns.']; % make a message
        
        causeException = MException( 'MATLAB:myCode:dimensions', msg );
        
        ME = addCause( ME, causeException );
   end
   rethrow( ME ) % print the new error
end 

% ME is an MException variable type (or class), more here:
% http://www.mathworks.com/help/matlab/ref/mexception-class.html?searchHighlight=MException
% This is a specific data type that is a 'structure' with certains 'fields' 
ME % let's print this variable to see what it is



