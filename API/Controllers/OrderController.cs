using API.Dtos;
using AutoMapper;
using Domain.Entities;
using Domain.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class OrderController : BaseApiController
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        
        public OrderController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<OrderDto>>> Get()
        {
            var order = await _unitOfWork.Orderse.GetAllAsync();
            return _mapper.Map<List<OrderDto>>(order);
        }
        
        [HttpGet("GetDelayedOrders")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<OrderDto>>> GetDelayedOrders()
        {
            var order = await _unitOfWork.Orderse.GetDelayedOrders();
            return Ok(order);
        }
        
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<OrderDto>> Get(int id)
        {
            var order = await _unitOfWork.Orderse.GetByIdAsync(id);
            if (order == null) return NotFound();
            return _mapper.Map<OrderDto>(order);
        }
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<Order>> Post(OrderDto orderDto)
        {
            var order = _mapper.Map<Order>(orderDto);
            _unitOfWork.Orderse.Add(order);
            await _unitOfWork.SaveAsync();
            if (order == null) return BadRequest();
            orderDto.Id = order.Id;
            return CreatedAtAction(nameof(Post), new { id = orderDto.Id }, orderDto);
        }
        
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<OrderDto>> Put(int id, [FromBody] OrderDto orderDto)
        {
            if (orderDto == null) return NotFound();
            if (orderDto.Id == 0) orderDto.Id = id;
            if (orderDto.Id != id) return BadRequest();
            var order = await _unitOfWork.Orderse.GetByIdAsync(id);
            _mapper.Map(orderDto, order);
            //order.FechaModificacion = DateTime.Now;
            _unitOfWork.Orderse.Update(order);
            await _unitOfWork.SaveAsync();
            return _mapper.Map<OrderDto>(order);
        
        }
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(int id)
        {
            var order = await _unitOfWork.Orderse.GetByIdAsync(id);
            if (order == null) return NotFound();
            _unitOfWork.Orderse.Remove(order);
            await _unitOfWork.SaveAsync();
            return NoContent();
        }
    }
}