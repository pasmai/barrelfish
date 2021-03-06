/**
 * \file
 * \brief Start the application processors
 *
 *  This file sends all needed IPIs to the other cores to start them.
 */

/*
 * Copyright (c) 2007, 2008, 2010, ETH Zurich.
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached LICENSE file.
 * If you do not find this file, copies can be found by writing to:
 * ETH Zurich D-INFK, Haldeneggsteig 4, CH-8092 Zurich. Attn: Systems Group.
 */

#include <kernel.h>
#include <stdio.h>
#include <string.h>
#include <arm_hal.h>
#include <start_aps.h>

#define STARTUP_TIMEOUT         0xffffff

#pragma GCC diagnostic ignored "-Wsuggest-attribute=noreturn"

/**
 * \brief Boot an arm app core
 *
 * \param core_id   APIC ID of the core to try booting
 * \param entry     Entry address for new kernel in the destination
 *                  architecture's lvaddr_t
 *
 * \returns Zero on successful boot, non-zero (error code) on failure
 */
int start_aps_arm_start(coreid_t core_id, genvaddr_t entry)
{
    panic("NYI");
#if 0
	//write entry address of new kernel to SYSFLAG reg
	write_sysflags_reg(entry);

	//raise SWI to signal app core to start
	gic_raise_softirq((1 << core_id), 1);
#endif

	return 0;
}
