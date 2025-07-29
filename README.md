# 🧠 8-bit Nano Processor

A lightweight 8-bit nano processor designed with simplicity, performance, and area efficiency in mind. This custom-built CPU supports a rich instruction set with immediate values and executes all instructions in a single clock cycle. The design leverages DSP blocks to minimize LUT usage, making it ideal for FPGA implementations with limited resources.

---

## 🚀 Features

- **8-bit architecture**
- **Single-cycle instruction execution**
- **Supports immediate values in instructions**
- **Optimized for low LUT usage using DSP blocks**
- Ideal for educational and small-scale embedded projects

---

## 🧾 Instruction Set

| Mnemonic   | Operation                     | Description                          |
|------------|-------------------------------|--------------------------------------|
| `NOP`      | No operation                  | Does nothing                         |
| `ADD`      | `R1 ← R1 + R2` or `R1 + imm`  | Adds register or immediate           |
| `SUB`      | `R1 ← R1 - R2` or `R1 - imm`  | Subtracts register or immediate      |
| `NEG`      | `R ← -R`                      | Negates the value                    |
| `MUL`      | `R1 ← R1 * R2` or `R1 * imm`  | Multiplies register or immediate     |
| `MOV`      | `R1 ← R2` or `R1 ← imm`       | Moves value                          |
| `LSH`      | Logical left shift            | `R ← R << 1`                         |
| `RSH`      | Logical right shift           | `R ← R >> 1`                         |
| `AND`      | Bitwise AND                   | `R1 ← R1 & R2` or `& imm`            |
| `OR`       | Bitwise OR                    | `R1 ← R1 \| R2` or `\| imm`          |
| `XOR`      | Bitwise XOR                   | `R1 ← R1 ^ R2` or `^ imm`            |
| `NOT`      | Bitwise NOT                   | `R ← ~R`                             |
| `JZR`      | Jump if zero                  | `PC ← addr` if `R == 0`              |
| `JMP`      | Unconditional jump            | `PC ← addr`                          |

---

## 🏗️ Architecture Overview

- **Instruction Width**: Custom format to include opcode, operand(s), and optional immediate values
- **Registers**: General-purpose register bank
- **ALU**: Implements arithmetic and logic instructions using DSP blocks
- **ROM**: For program storage
- **Program Counter (PC)**: Tracks instruction address
- **Single-cycle execution**: All instructions are executed within one clock cycle

---

## 💡 Design Goals

- 🔋 **Efficiency**: Uses DSP slices to reduce LUT and logic resource usage
- ⚡ **Speed**: All instructions complete in one cycle
- 🧩 **Modularity**: Easily expandable with new instructions or peripherals

---

## 🧪 Testing

- **Testbench included**: Validate each instruction with simulation
- **Example programs**: Demonstrating usage of arithmetic, logic, and control instructions

---

## 🔧 Tools & Technologies

- **Language**: VHDL
- **Simulation**: Vivado Sim
- **Synthesis**: Vivado
- **Target**: Any FPGA supporting DSP blocks (e.g., Xilinx Spartan/Artix series)

---

## 📜 License

This project is licensed under the MIT License.

---

## 🙌 Acknowledgements

This project was built as university assignment in collaboration with,
- Buwaneka - [hhh-berzerk](https://github.com/hhh-berzerk)
- Shaluka - [shalukahhstt](https://github.com/shalukahhstt)
- Sahan

---

## 📬 Contact

For suggestions or collaboration, feel free to reach out via GitHub issues or pull requests.

