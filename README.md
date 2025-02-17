# **🔢 ASM Calculator - A Sophisticated Assembly Project**

## 🚀 Introduction

This project represents a deep dive into low-level programming and is an excellent demonstration of the power and intricacies of assembly. Through this calculator, multiple functionalities have been implemented, from basic arithmetic operations to more complex algorithms like the **Euclidean algorithm** for GCD (Greatest Common Divisor), all while leveraging the raw capabilities of assembly. 🛠️

---

## ✨ Features

- **🖥️ User Interface**:  
  The program starts by displaying a simple text-based menu, allowing the user to choose from several operations such as addition, subtraction, multiplication, division, and calculating the GCD. The interface is minimalistic yet functional, reflecting the core nature of assembly language programming.

- **⌨️ User Input**:  
  Input is captured using the `SCAN_NUM` procedure in **emu8086**, which stores the user input in the **CX** register for subsequent operations. To facilitate easy manipulation, results are stored in pre-defined variables (`a`, `b`, `c`).

- **🧮 Core Operations**:
  - ➕ **Addition** / ➖ **Subtraction** / ✖️ **Multiplication**: Basic arithmetic operations, directly mapped from the user’s input.
  - ➗ **Division**: This handles division by zero gracefully, providing an error message if the denominator is zero.
  - 📏 **GCD Calculation**: Utilizes the **difference algorithm** (a simplified version of the Euclidean algorithm) to compute the greatest common divisor efficiently.

- **📊 Number Display**:  
  Numbers are displayed using a custom **stack-based procedure**. This method leverages the stack for **push** and **pop** operations to display the result in a readable decimal format. The procedure ensures that numbers are shown in human-readable decimal form instead of ASCII characters.

---

## 📜 Code Breakdown

### 1. **📋 Menu Display**  
The program first displays a menu with options for the user to choose from. `0Dh` and `0Ah` (carriage return and line feed) are used to format the menu for a clean, organized output.

### 2. **📥 User Input Handling**  
Upon selection of an operation, the program compares the ASCII values of the user input (1-9) to determine which operation to execute. If an invalid character is entered, an error message is displayed. ❌

### 3. **⚡ Arithmetic Operations**  
For arithmetic operations, the program calls specific procedures tailored for each type (addition, subtraction, etc.). The `SCAN_NUM` procedure captures user input, and the corresponding registers (`AX`, `BX`, `CX`) are used for calculations.

### 4. **🔢 Number Display Procedure (Stack-Based)**

```assembly
affichage:  
  empiler:  
    div bx  
    add dx, 48  
    push dx  
    mov dx, 0  
    inc cx  
    cmp ax, 0  
    jne empiler  

  depiler:  
    pop dx  
    mov ah, 02h  
    int 21h  
    loop depiler  
    jmp exit
```

This procedure, leveraging **push** and **pop** operations, displays numbers by converting them to ASCII values and printing them one digit at a time.

### 5. **🏁 Exit Procedure**  
Upon completing an operation, a **gratitude message** is displayed, and control is returned to the operating system. 🎉

---

## 🛠️ Technical Insights

- **⚙️ Registers Utilized**:  
  The program uses registers such as `AX`, `BX`, `CX`, and `DX` for computation and data handling. Specifically, `CX` is used as a counter, and `DX` is used to store the remainder from division operations.
  
- **📌 Memory Management**:  
  The program makes effective use of the stack for storing intermediate results, ensuring that the program is both memory-efficient and reliable.

- **📐 Algorithm Choices**:  
  The **difference algorithm** used for calculating the GCD is an elegant and simple approach, chosen for its straightforward implementation in assembly.

---

## 💡 Challenges and Growth

Developing this project required a deep understanding of assembly language, including hardware interaction, register management, and precise program control. The process highlighted the power of low-level programming and its role in optimizing performance and resource management. 🤓

Every step of the way, knowledge was expanded in terms of how hardware interacts with software, how registers hold critical data, and how the program flow can be controlled with such precision. 🖥️

This project stands as an example of the potential and efficiency of assembly language programming. 🚀

---

## 🎯 Conclusion

Thank you for taking the time to explore this **ASM Calculator** project. It is designed to serve as a useful resource for those seeking to understand assembly language programming in a more practical context. 💡

If you have any questions or feedback, feel free to reach out! 📩


**Developed by Berraho Khalil**

