# Median Filter FPGA

A hardware implementation of a **median image filter** on FPGA using VHDL, developed as part of the *VLSI Systems Design (19E043VLSI)* course at the **School of Electrical Engineering, University of Belgrade**.

---

## Project Overview

This project implements a median filter for grayscale image denoising (impulse noise removal) on an FPGA development board. The system reads a corrupted 256×256 8-bit grayscale image from BRAM, applies a 3×3 median filter, and writes the result back to memory.

The project is divided into two parts:

### Part 1 – Median Extraction Network
A sorting network based on the **Odd-Even Merge** architecture is used to sort 9 neighboring 8-bit pixels and extract the median value (the 5th element, `s[4]`). Comparator blocks that do not contribute to the median output are omitted, as they are optimized away during synthesis anyway.

- Implemented with input/output registers
- Pipelined version implemented to maximize operating frequency
- Both versions synthesized using *out-of-context* implementation and their maximum frequencies compared
- All components simulated with accompanying testbench files

### Part 2 – Median Filter System
The full image filtering system reads pixels from a BRAM memory (`im_ram.vhd`), applies the 3×3 median filter, and writes filtered values back to the same memory.

- The image in memory is a 254×254 pixel image zero-padded to 256×256 (matching SciPy's `medfilt2d` behavior)
- A **sliding window** structure is implemented using two FIFO buffers (depth 253) to enable processing of one pixel per clock cycle
- Filtered output is saved to a file and compared against a Python (SciPy) software reference
- Maximum operating frequency of the full system is determined

---

## File Structure

```
median-filter-fpga/
│
├── hdl/                        # VHDL source files
│   ├── min_max.vhd             # Comparator block – outputs min and max of two inputs
│   ├── odd_even_merge.vhd      # Odd-Even Merge sorting network (median extraction)
│   ├── line_buffer.vhd         # FIFO line buffer for sliding window
│   ├── 8b_reg.vhd              # 8-bit register
│   ├── RAM_definitions_PK.vhd  # RAM type/package definitions
│   ├── im_ram.vhd              # BRAM memory module (Simple Dual Port, 256×256)
│   └── median_filter.vhd       # Top-level median filter module
│
├── tb/                         # Testbench files
│   ├── tb_min_max.vhd          # Testbench for comparator block
│   ├── tb_odd-even_merge.vhd   # Testbench for sorting network
│   ├── tb_line_buffer.vhd      # Testbench for FIFO line buffer
│   ├── tb_im_ram.vhd           # Testbench for BRAM memory
│   └── tb_median_filter.vhd    # Testbench for top-level median filter
│
├── constrs/                    # Constraints
│   └── constr.xdc              # Xilinx Design Constraints (timing & pin assignment)
│
├── data/                       # Image data files
│   └── lenaCorrupted.dat       # Input corrupted image (used for BRAM initialization)
│
├── python/                     # Python reference scripts
│   └── main.py                 # SciPy-based software median filter for comparison
│
├── vivado_loger/               # TCL scripts for signal logging from Vivado console
│
└── README.md
```

---

## Setup & How to Run

### Requirements
- [Xilinx Vivado](https://www.xilinx.com/support/download.html) (tested with 2020.x or later)
- Python 3 with `numpy`, `scipy`, and `matplotlib` for the reference script
- An FPGA development board (Xilinx 7-series or compatible)

### Running the Simulation in Vivado

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/median-filter-fpga.git
   cd median-filter-fpga
   ```

2. Open Vivado and create a new project, or open the existing project file if included.

3. Add all HDL source files from `hdl/` and testbench files from `tb/`.

4. Make sure `lenaCorrupted.dat` is placed in the same directory as `im_ram.vhd` (or adjust the file path inside the VHDL file).

5. Run behavioral simulation for the desired testbench.

6. To save filtered output, either:
   - Use the testbench file-write mechanism (see `tb_median_filter.vhd`), or
   - Use the TCL logging scripts in `vivado_loger/` from the Vivado console.

### Comparing with Python Reference

```bash
cd python
pip install numpy scipy matplotlib
python main.py
```

The script loads the corrupted image, applies `medfilt2d`, and displays both the original and filtered images for comparison with the hardware output.

---

## Architecture Notes

### Odd-Even Merge Sorting Network
The sorting network takes 9 unsigned 8-bit inputs `a[0]–a[8]` and produces a sorted output `s[0]–s[8]`. Only the path leading to `s[4]` (the median) is required and fully implemented. Gray-colored comparator blocks in the diagram are not needed and are excluded.

### Sliding Window with FIFO Buffers
To achieve **one pixel per clock cycle** throughput, the design uses:
- Two FIFO buffers of depth 253 to buffer two previous image rows
- A 3×3 register array that shifts with each new pixel
- The median network processes the 9-element window on every clock cycle

### BRAM Memory
The image is stored in a **Simple Dual Port BRAM** (`im_ram.vhd`), initialized from `lenaCorrupted.dat`. It occupies 16 BRAM blocks (2 cascaded blocks per bit), as described in Xilinx UG473.

---

## Authors

This project was done in pairs, so my friend and I built this together.

*School of Electrical Engineering, University of Belgrade*
*VLSI Systems Design (19E043VLSI)*

---

## License

This project is licensed under the [MIT License](LICENSE).
