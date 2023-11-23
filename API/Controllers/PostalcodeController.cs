using API.Dtos;
using AutoMapper;
using Domain.Entities;
using Domain.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class PostalcodeController : BaseApiController
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        
        public PostalcodeController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<PostalcodeDto>>> Get()
        {
            var postalcode = await _unitOfWork.PCodes.GetAllAsync();
            return _mapper.Map<List<PostalcodeDto>>(postalcode);
        }
        
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<PostalcodeDto>> Get(int id)
        {
            var postalcode = await _unitOfWork.PCodes.GetByIdAsync(id);
            if (postalcode == null) return NotFound();
            return _mapper.Map<PostalcodeDto>(postalcode);
        }
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<Postalcode>> Post(PostalcodeDto postalcodeDto)
        {
            var postalcode = _mapper.Map<Postalcode>(postalcodeDto);
            _unitOfWork.PCodes.Add(postalcode);
            await _unitOfWork.SaveAsync();
            if (postalcode == null) return BadRequest();
            postalcodeDto.Id = postalcode.Id;
            return CreatedAtAction(nameof(Post), new { id = postalcodeDto.Id }, postalcodeDto);
        }
        
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<PostalcodeDto>> Put(int id, [FromBody] PostalcodeDto postalcodeDto)
        {
            if (postalcodeDto == null) return NotFound();
            if (postalcodeDto.Id == 0) postalcodeDto.Id = id;
            if (postalcodeDto.Id != id) return BadRequest();
            var postalcode = await _unitOfWork.PCodes.GetByIdAsync(id);
            _mapper.Map(postalcodeDto, postalcode);
            //postalcode.FechaModificacion = DateTime.Now;
            _unitOfWork.PCodes.Update(postalcode);
            await _unitOfWork.SaveAsync();
            return _mapper.Map<PostalcodeDto>(postalcode);
        
        }
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(int id)
        {
            var postalcode = await _unitOfWork.PCodes.GetByIdAsync(id);
            if (postalcode == null) return NotFound();
            _unitOfWork.PCodes.Remove(postalcode);
            await _unitOfWork.SaveAsync();
            return NoContent();
        }
    }
}