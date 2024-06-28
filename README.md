
# Stack Based ALU
![download (3)](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/7755e1ec-80e7-4104-9b9d-a6bc5fbb92b2)


In this repository, you can see the code to a stack_based_alu that performs arithmetic operations using a stack, as well as basic stack operations in Verilog.



## Tools
For this project, we used the following tools to implement our model
- Visual Studios
- ModelSim

## Implementation Details
To better understand how this model works and what the results are when running the testbench on it, visit Report.pdf to get a completely detailed explanation of the implementation and the results, but to get an overall view of the code, the code has one module that takes an input, an opcode and has an output. This ALU can perform 4 different operations, Adding, Multiplying, Pushing, Poping. The whole code works based on an always block and a switch case that decides the operation based on the opcode. Once entered into a case, the necessary actions are performed so that our stack gets updated or the expected result is shown in the output of the module. 
Below is an overall view of the main part of the code. 
![image](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/8487b7e4-57e4-48a0-8e0d-733e5c661db6)

In the testbench module, a common test is implemented for all the ALUs with different sizes and later specific tests are run for different sizes and different operations. At the end of the testbench, some edge cases for different operations are tested to see if the proper error message is produced. 
![image](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/c753399f-104e-4751-bbdd-e0ddaf1ab18e)
![image](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/8a321839-2585-470a-a8dc-f26eb5850595)
![image](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/a6ac0aae-bea3-4898-a17c-1ccee48e45a6)



## How to Run
To run the code for yourself, you first need to open ModelSim and then open the project on it. 
Later, you need to compile the Verilog files which are in the project. 
![Screenshot 2024-06-26 231029](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/6816cd19-aae5-4fdf-8000-fadb625cd47c)


When your compiling is finished you need to choose the right module to simulate on. In order to accomplish this, you need to go to the simulation section in the top bar and select Start Simulation. If you do this, a page like the one in the image pops up for you. 
![Screenshot 2024-06-26 231150](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/47791634-f18a-4a1e-9dad-61d2132c7379)


## Results
After choosing the right module, you will enter a space like the image below. From there, you can do multiple things by using the waveform and the transcript to check your results.
![image](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/3fb837cc-dbe7-47ee-ba85-7ba6ad794cf8)

In the end, you can also choose the signals to be shown on a waveform, you have to select the signals from the Objects panel and transfer them to the waveform. After this by setting the time you want to simulate your program, you simulate your code and view the waveform. 
![image](https://github.com/Mohammad-Hossein-Eslami/Stack_Based_ALU/assets/119133038/e881e6e8-d57b-4984-91ad-5656dbb2ad9a)


In the end, if your code is synthesizable you can use tools such as Quartus to get different reports from your code. These reports include the features of the circuit you designed such as the maximum clock frequency


## Related Links
- [VScode](https://code.visualstudio.com/download)
- [ModelSim](https://www.intel.com/content/www/us/en/software-kit/750368/modelsim-intel-fpgas-standard-edition-software-version-18-1.html)

## Author
- Mohammad Hossein Eslami



