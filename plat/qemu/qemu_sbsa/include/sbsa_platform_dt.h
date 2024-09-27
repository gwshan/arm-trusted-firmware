/*
 * Copyright (c) 2024-2025, Linaro Limited and Contributors. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef SBSA_PLATFORM_DT_H
#define SBSA_PLATFORM_DT_H

#include <platform_def.h>
#include <stdint.h>

typedef struct {
	uint32_t nodeid;
	uint32_t mpidr;
} cpu_data;

typedef struct {
	uint32_t nodeid;
	uint64_t addr_base;
	uint64_t addr_size;
} memory_data;

/*
 * sockets: the number of sockets on sbsa-ref platform.
 * clusters: the number of clusters in one socket.
 * cores: the number of cores in one cluster.
 * threads: the number of threads in one core.
 */
typedef struct {
	uint32_t sockets;
	uint32_t clusters;
	uint32_t cores;
	uint32_t threads;
} cpu_topology;

struct qemu_platform_info {
	uint32_t num_cpus;
	uint32_t num_memnodes;
	cpu_data cpu[PLATFORM_CORE_COUNT];
	cpu_topology cpu_topo;
	memory_data memory[PLAT_MAX_MEM_NODES];
};

void sbsa_platform_dt_init(void);

#endif /* SBSA_PLATFORM_DT_H */
