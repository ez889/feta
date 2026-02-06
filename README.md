# Feta Cheese Production Line (PLC Project)

This project is a reconstruction of a **real industrial Feta cheese production line**, based on practical experience and memory from a working machine.

The line consists of **five main technological phases** connected by conveyors:

1. Čase (Container loading)
2. Punilica (Filling)
3. Tunel (Processing / cooking)
4. Noz (Cutting)
5. Pakerica (Packaging)

The project is implemented as a **PLC logic model**, using motors, pneumatic cylinders, sensors, timers, and conveyors.  
Some processes are simplified, but the **main technological sequence and control philosophy are preserved**.

---

## Phase 1 — Čase (Container Handling)

In this phase, the operator manually brings **plastic containers** for cheese and loads them into a magazine or lifting mechanism.

The containers wait in this lift until they are prepared for transfer to the conveyor.  
Pneumatic cylinders and sensors are used to:
- detect container presence,
- position the containers correctly,
- push them onto the conveyor.

After positioning, the containers are transferred to the next phase, where the cheese mixture is added.

---

## Phase 2 — Punilica (Filling)

The Punilica phase fills the containers with cheese mixture.

For simplicity, the project uses **only one recipe**.  
In a real industrial application, this phase is typically implemented using a **CASE OF (step-based) algorithm** with multiple recipes and parameters.

---

## Phase 3 — Tunel (Processing / Cooking)

After filling, the containers enter the tunnel, where the cheese requires time to process (for example, **approximately 30 minutes**).

Key characteristics:
- Tunnel length: approx. **5 × 20 meters**
- Containers move continuously through the tunnel on a conveyor
- Processing time is achieved by conveyor speed and tunnel length

At the end of the tunnel:
- sensors detect container position,
- a perpendicular conveyor transfers containers to the next phase (Noz).

---

## Phase 4 — Noz (Cutting)

In the Noz phase:
- a small motor drives a rotating table,
- a knife mechanism moves up and down.

---

## Phase 5 — Pakerica (Packaging)

The final phase is packaging. It consists of **six sequential procedures**:

1. Placing paper into the container  
2. Adding salt  
3. Adding aluminum covers  
4. Sealing (hermetization) of aluminum covers  
5. Adding plastic covers  
6. Transferring the finished container to the warehouse conveyor  

---

## Notes

- The project is reconstructed **from memory and real industrial experience**.
- Some details are simplified for clarity and learning purposes.
- The main goal is to demonstrate:
  - industrial PLC logic structure,
  - sequencing of technological processes,
  - interaction between sensors, actuators, and conveyors.

This project is intended for **educational and portfolio purposes** and reflects real-world automation concepts used in food industry production lines.

![photo_2026-02-06_19-12-40](https://github.com/user-attachments/assets/a4dfb688-ab3b-4f50-a07f-7d5e87ff1a1b)


