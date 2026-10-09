# Molecular dynamics simulations of ketal-linked paclitaxel prodrug–carrier systems

Molecular structures, force-field parameters, and simulation inputs accompanying:

**Structure–Hydrolysis Relationships of Unsymmetrical Acyclic Ketal-Linked Prodrugs and Their Physicochemical Compatibility with Polymeric Carriers**

The simulations examine the association of P7-2°C16 with mPEG–PDLLA, mPEG–PCL, and mPEG–DSPE. Each assembly system contains **10 prodrug molecules and 30 carrier molecules in an initial 15 × 15 × 15 nm³ box**.

## Repository contents

| File or directory | Description |
| --- | --- |
| [METHODS.md](METHODS.md) | Structure preparation, polymer construction, and simulation workflow |
| [mPEGPDLLA_P72C16/](mPEGPDLLA_P72C16/) | mPEG–PDLLA/P7-2°C16 inputs |
| [mPEGPCL_P72C16/](mPEGPCL_P72C16/) | mPEG–PCL/P7-2°C16 inputs |
| [mPEGDSPE_P72C16/](mPEGDSPE_P72C16/) | mPEG–DSPE/P7-2°C16 inputs |
| [0-forcefields/](0-forcefields/) | Force-field files; the simulations use `charmm36-jul2022.ff` |
| [run.sh](run.sh) | Packmol and GROMACS workflow |

Each system directory contains molecular coordinates (`.pdb`), molecular topologies (`.itp`), additional parameters (`.prm`), a system topology (`topol.top`), a Packmol input (`packmol.inp`), and GROMACS control files (`.mdp`). The polymer PDB files used by Packmol were obtained after a separate 4 ns NPT relaxation in water.

## Software

Structure preparation used ChemDraw, Chem3D, xTB, CGenFF, and the `ztop` Python workflow (https://gitee.com/coordmagic/coordmagic). System packing and simulations used Packmol and GROMACS 2023, respectively, with CHARMM36/CGenFF parameters and CHARMM TIP3P water.

## Use

Keep the directory layout intact so that coordinate and topology references remain consistent. `run.sh` outlines system construction and the simulation stages. Solvent and ion counts and index groups should be regenerated when rebuilding a system. Simulation methods and control-file descriptions are provided in [METHODS.md](METHODS.md).
