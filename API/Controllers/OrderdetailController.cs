using API.Dtos;
using AutoMapper;
using Domain.Entities;
using Domain.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class OrderdetailController : BaseApiController
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        
        public OrderdetailController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<OrderdetailDto>>> Get()
        {
            var orderdetail = await _unitOfWork.Details.GetAllAsync();
            return _mapper.Map<List<OrderdetailDto>>(orderdetail);
        }
        
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<OrderdetailDto>> Get(int id)
        {
            var orderdetail = await _unitOfWork.Details.GetByIdAsync(id);
            if (orderdetail == null) return NotFound();
            return _mapper.Map<OrderdetailDto>(orderdetail);
        }
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<Orderdetail>> Post(OrderdetailDto orderdetailDto)
        {
            var orderdetail = _mapper.Map<Orderdetail>(orderdetailDto);
            _unitOfWork.Details.Add(orderdetail);
            await _unitOfWork.SaveAsync();
            if (orderdetail == null) return BadRequest();
            orderdetailDto.Id = orderdetail.Id;
            return CreatedAtAction(nameof(Post), new { id = orderdetailDto.Id }, orderdetailDto);
        }
        
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<OrderdetailDto>> Put(int id, [FromBody] OrderdetailDto orderdetailDto)
        {
            if (orderdetailDto == null) return NotFound();
            if (orderdetailDto.Id == 0) orderdetailDto.Id = id;
            if (orderdetailDto.Id != id) return BadRequest();
            var orderdetail = await _unitOfWork.Details.GetByIdAsync(id);
            _mapper.Map(orderdetailDto, orderdetail);
            //orderdetail.FechaModificacion = DateTime.Now;
            _unitOfWork.Details.Update(orderdetail);
            await _unitOfWork.SaveAsync();
            return _mapper.Map<OrderdetailDto>(orderdetail);
        
        }
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(int id)
        {
            var orderdetail = await _unitOfWork.Details.GetByIdAsync(id);
            if (orderdetail == null) return NotFound();
            _unitOfWork.Details.Remove(orderdetail);
            await _unitOfWork.SaveAsync();
            return NoContent();
        }
    }
}