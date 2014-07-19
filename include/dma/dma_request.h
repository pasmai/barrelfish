/*
 * Copyright (c) 2014 ETH Zurich.
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached LICENSE file.
 * If you do not find this file, copies can be found by writing to:
 * ETH Zurich D-INFK, Universitaetsstrasse 6, CH-8092 Zurich. Attn: Systems Group.
 */

#ifndef LIB_DMA_REQUEST_H
#define LIB_DMA_REQUEST_H

struct dma_request;

/// IOAT DMA request ID
typedef uint64_t dma_req_id_t;

/// callback to be called when the request is finished
typedef void (*dma_req_cb_t)(errval_t,
                             dma_req_id_t,
                             void *);

/**
 * enumeration of the possible request types
 */
typedef enum dma_req_type
{
    IOAT_DMA_REQ_TYPE_INVALID,  ///< invalid request
    IOAT_DMA_REQ_TYPE_NOP,      ///< NULL / NOP request
    IOAT_DMA_REQ_TYPE_MEMCPY    ///< Memcpy request
} dma_req_type_t;

/**
 * enumeration of the request states
 */
typedef enum dma_req_st
{
    DMA_REQ_ST_INVALID,    ///< request is invalid
    DMA_REQ_ST_PREPARED,   ///< request is prepared
    DMA_REQ_ST_SUBMITTED,  ///< request is submitted to hardware
    DMA_REQ_ST_DONE,       ///< request has been executed
    DMA_REQ_ST_ERR         ///< request execution failed
} dma_req_st_t;

/**
 * specifies the DMA request setup fields
 */
struct dma_req_setup
{
    dma_req_type_t type;           ///< specifies the request type
    dma_req_cb_t done_cb;          ///< callback for executed request
    void *cb_arg;                  ///< argument for the callback
    union
    {
        struct
        {
            lpaddr_t src;          ///< source physical address
            lpaddr_t dst;          ///< destination physical address
            size_t bytes;          ///< size of the transfer in bytes
            uint8_t ctrl_intr :1;  ///< do an interrupt upon completion
            uint8_t ctrl_fence :1; ///< do a mem fence upon completion
        } memcpy;                  ///< memcpy request
        struct {

        } nop;

    } args;                        ///< request setup arguments

};

/*
 * ----------------------------------------------------------------------------
 * Getter / Setter Functions
 * ----------------------------------------------------------------------------
 */

/**
 * \brief returns the state of a DMA request
 *
 * \param req   DMA request
 *
 * \returns DMA request state
 */
dma_req_st_t dma_request_get_state(struct dma_request *req);

/**
 * \brief returns the ID of a DMA request
 *
 * \param req   DMA request
 *
 * \returns DMA request ID
 */
dma_req_id_t dma_request_get_id(struct dma_request *req);


/**
 * \brief returns the next DMA request of the given request
 *
 * \param req   DMA request
 *
 * \returns DMA request if there was one
 *          NULL if the request is at the end of the chain
 */
struct dma_request *dma_request_get_next(struct dma_request *req);

/*
 * ----------------------------------------------------------------------------
 * Request Execution
 * ----------------------------------------------------------------------------
 */

/**
 *
 */
errval_t dma_request_memcpy(struct dma_req_setup *setup);

/**
 *
 */
errval_t dma_request_nop(struct dma_req_setup *setup);

/**
 *
 */
errval_t dma_request_exec(struct dma_req_setup *setup);


/*
 * ----------------------------------------------------------------------------
 * Helper Functions
 * ----------------------------------------------------------------------------
 */

/**
 * \brief builds the DMA request ID for a request counter value on a give channel
 *
 * \param chan  the DMA channel
 * \param req   request counter value
 *
 * \return DMA request ID
 */
static inline dma_req_id_t dma_request_id_build(struct dma_channel *chan,
                                                uint64_t req)
{
    dma_req_id_t id = (dma_req_id_t)dma_channel_get_id(chan);
    id <<= 48;
    id |= (0x0000FFFFFFFFFFFFULL & req);
    return id;
}

/**
 * \brief obtains the DMA channel ID from the request ID
 *
 * \param id the DMA request ID
 *
 * \return DMA channel ID
 */
static inline dma_chan_id_t dma_request_id_get_channel_id(dma_req_id_t id)
{
    return (dma_chan_id_t)((id >> 48) & 0xFFFF);
}

/**
 * \brief obtains the DMA device ID from the request ID
 *
 * \param id the DMA request ID
 *
 * \return DMA device ID
 */
static inline dma_chan_id_t dma_request_id_get_device_id(dma_req_id_t id)
{
    return dma_channel_id_get_device_id(dma_request_id_get_channel_id(id));
}


#endif  /* LIB_DMA_REQUEST_H */
