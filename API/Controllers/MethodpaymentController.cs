using API.Dtos;
using AutoMapper;
using Domain.Entities;
using Domain.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class MethodpaymentController : BaseApiController
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        
        public MethodpaymentController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<MethodpaymentDto>>> Get()
        {
            var methodpayment = await _unitOfWork.Methods.GetAllAsync();
            return _mapper.Map<List<MethodpaymentDto>>(methodpayment);
        }
        
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<MethodpaymentDto>> Get(int id)
        {
            var methodpayment = await _unitOfWork.Methods.GetByIdAsync(id);
            if (methodpayment == null) return NotFound();
            return _mapper.Map<MethodpaymentDto>(methodpayment);
        }
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<Methodpayment>> Post(MethodpaymentDto methodpaymentDto)
        {
            var methodpayment = _mapper.Map<Methodpayment>(methodpaymentDto);
            _unitOfWork.Methods.Add(methodpayment);
            await _unitOfWork.SaveAsync();
            if (methodpayment == null) return BadRequest();
            methodpaymentDto.Id = methodpayment.Id;
            return CreatedAtAction(nameof(Post), new { id = methodpaymentDto.Id }, methodpaymentDto);
        }
        
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<MethodpaymentDto>> Put(int id, [FromBody] MethodpaymentDto methodpaymentDto)
        {
            if (methodpaymentDto == null) return NotFound();
            if (methodpaymentDto.Id == 0) methodpaymentDto.Id = id;
            if (methodpaymentDto.Id != id) return BadRequest();
            var methodpayment = await _unitOfWork.Methods.GetByIdAsync(id);
            _mapper.Map(methodpaymentDto, methodpayment);
            //methodpayment.FechaModificacion = DateTime.Now;
            _unitOfWork.Methods.Update(methodpayment);
            await _unitOfWork.SaveAsync();
            return _mapper.Map<MethodpaymentDto>(methodpayment);
        
        }
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(int id)
        {
            var methodpayment = await _unitOfWork.Methods.GetByIdAsync(id);
            if (methodpayment == null) return NotFound();
            _unitOfWork.Methods.Remove(methodpayment);
            await _unitOfWork.SaveAsync();
            return NoContent();
        }
    }
}