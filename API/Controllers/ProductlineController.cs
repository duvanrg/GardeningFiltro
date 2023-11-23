using API.Dtos;
using AutoMapper;
using Domain.Entities;
using Domain.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class ProductlineController : BaseApiController
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        
        public ProductlineController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<ProductlineDto>>> Get()
        {
            var productline = await _unitOfWork.PLines.GetAllAsync();
            return _mapper.Map<List<ProductlineDto>>(productline);
        }
        
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ProductlineDto>> Get(int id)
        {
            var productline = await _unitOfWork.PLines.GetByIdAsync(id);
            if (productline == null) return NotFound();
            return _mapper.Map<ProductlineDto>(productline);
        }
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<Productline>> Post(ProductlineDto productlineDto)
        {
            var productline = _mapper.Map<Productline>(productlineDto);
            _unitOfWork.PLines.Add(productline);
            await _unitOfWork.SaveAsync();
            if (productline == null) return BadRequest();
            productlineDto.Id = productline.Id;
            return CreatedAtAction(nameof(Post), new { id = productlineDto.Id }, productlineDto);
        }
        
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<ProductlineDto>> Put(int id, [FromBody] ProductlineDto productlineDto)
        {
            if (productlineDto == null) return NotFound();
            if (productlineDto.Id == 0) productlineDto.Id = id;
            if (productlineDto.Id != id) return BadRequest();
            var productline = await _unitOfWork.PLines.GetByIdAsync(id);
            _mapper.Map(productlineDto, productline);
            //productline.FechaModificacion = DateTime.Now;
            _unitOfWork.PLines.Update(productline);
            await _unitOfWork.SaveAsync();
            return _mapper.Map<ProductlineDto>(productline);
        
        }
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(int id)
        {
            var productline = await _unitOfWork.PLines.GetByIdAsync(id);
            if (productline == null) return NotFound();
            _unitOfWork.PLines.Remove(productline);
            await _unitOfWork.SaveAsync();
            return NoContent();
        }
    }
}