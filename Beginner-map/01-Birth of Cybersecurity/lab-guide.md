# 🧪 Morris Worm Laboratory

> **Difficulty:** Beginner
> **Estimated Time:** 15–20 minutes
> **Skills Learned:** Docker, Linux processes, CPU monitoring, `ps`, `top`, `sudo`, `kill`, basic incident response

---

# Objective

In this lab, your goal is to investigate an infected Linux machine.

The machine has already been compromised by a simplified version of the **Morris Worm**.

Your mission is to:

- Observe the symptoms of infection.
- Identify the malicious process.
- Stop the worm.
- Verify the system has recovered.
- Retrieve the flag.

---

# Step 1 — Build the Lab

Open a terminal inside the **morris-lab** directory and build the Docker image.

```bash
docker compose up --build
```

### Why?

Docker creates an isolated Linux environment that behaves like a real machine.

This allows you to safely practice incident response without affecting your own computer.

---

# Step 2 — Enter the Machine

Open another terminal and execute:

```bash
docker exec -it --user victim morris-lab bash
```

You are now logged into the compromised machine as the user **victim**.

---

# Step 3 — Observe the System

Before touching anything, investigate.

Run:

```bash
top
```

### Why?

`top` displays live system information.

Pay attention to:

- CPU Usage
- Running Processes
- Which process is consuming the most resources

The Morris Worm continuously replicates itself.

Although this lab simplifies its behavior, the process is intentionally consuming CPU time to simulate how uncontrolled malware can make a system slow and unresponsive.

Press **Q** to exit `top`.

---

# Step 4 — Find the Malicious Process

Now list all running processes.

```bash
ps aux
```

### Why?

Everything running on a Linux system is represented as a **process**.

`ps aux` displays:

- The owner of each process
- The Process ID (PID)
- CPU usage
- Memory usage
- The command that started the process

Find the process named:

```
morris.sh
```

Take note of its **PID**.

---

# Step 5 — Stop the Worm

Try killing the process.

```bash
kill <PID>
```

Example:

```bash
kill 24
```

You will likely receive:

```
Operation not permitted
```

### Why?

The Morris Worm is running as the **root** user.

Linux protects system processes from being terminated by normal users.

To perform administrative tasks, Linux provides the **sudo** command.

Run:

```bash
sudo kill <PID>
```

Password:

```
victim123
```

### What is sudo?

`sudo` stands for **Super User DO**.

It temporarily grants administrator privileges to execute a single command.

Instead of logging in as root, administrators normally use `sudo` to perform privileged operations.

---

# Step 6 — Verify the Threat Has Been Removed

Run:

```bash
top
```

again.

### Why?

Incident response does not end after stopping the malware.

Always verify that:

- CPU usage has decreased.
- The malicious process is no longer running.
- The system has returned to a healthy state.

Press **Q** to exit.

You can also confirm with:

```bash
ps aux
```

The `morris.sh` process should no longer appear.

---

# Step 7 — Retrieve the Flag

Once the worm has been terminated, the system automatically generates a flag.

Display it using:

```bash
cat /home/victim/flag.txt
```

If everything was completed correctly, you'll see:

```
KYTINX{...}
```

Congratulations!

---

# What You Learned

In this lab, you practiced the first steps of incident response.

✅ Monitoring CPU usage

✅ Investigating running processes

✅ Understanding Process IDs (PID)

✅ Using `ps` and `top`

✅ Using `sudo` for administrative actions

✅ Terminating a malicious process

✅ Verifying system recovery

---

# Historical Connection

The original Morris Worm did **not** destroy files or steal passwords.

Instead, it continuously replicated itself.

As more and more copies were created, systems became overloaded, network bandwidth was consumed, and legitimate users were unable to use their computers.

This behavior introduced the world to an important lesson:

> Sometimes **availability** is just as important as **confidentiality**.

Even software written without malicious intent can cause widespread disruption if proper safeguards are missing.

---

# What's Next?

You've just completed your first incident response task.

In the next chapter, you'll learn how devices communicate and why the internet exists.
