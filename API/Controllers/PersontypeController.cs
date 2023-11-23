using API.Dtos;
using AutoMapper;
using Domain.Entities;
using Domain.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class PersontypeController : BaseApiController
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        
        public PersontypeController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<PersontypeDto>>> Get()
        {
            var persontype = await _unitOfWork.PTypes.GetAllAsync();
            return _mapper.Map<List<PersontypeDto>>(persontype);
        }
        
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<PersontypeDto>> Get(int id)
        {
            var persontype = await _unitOfWork.PTypes.GetByIdAsync(id);
            if (persontype == null) return NotFound();
            return _mapper.Map<PersontypeDto>(persontype);
        }
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<Persontype>> Post(PersontypeDto persontypeDto)
        {
            var persontype = _mapper.Map<Persontype>(persontypeDto);
            _unitOfWork.PTypes.Add(persontype);
            await _unitOfWork.SaveAsync();
            if (persontype == null) return BadRequest();
            persontypeDto.Id = persontype.Id;
            return CreatedAtAction(nameof(Post), new { id = persontypeDto.Id }, persontypeDto);
        }
        
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<PersontypeDto>> Put(int id, [FromBody] PersontypeDto persontypeDto)
        {
            if (persontypeDto == null) return NotFound();
            if (persontypeDto.Id == 0) persontypeDto.Id = id;
            if (persontypeDto.Id != id) return BadRequest();
            var persontype = await _unitOfWork.PTypes.GetByIdAsync(id);
            _mapper.Map(persontypeDto, persontype);
            //persontype.FechaModificacion = DateTime.Now;
            _unitOfWork.PTypes.Update(persontype);
            await _unitOfWork.SaveAsync();
            return _mapper.Map<PersontypeDto>(persontype);
        
        }
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(int id)
        {
            var persontype = await _unitOfWork.PTypes.GetByIdAsync(id);
            if (persontype == null) return NotFound();
            _unitOfWork.PTypes.Remove(persontype);
            await _unitOfWork.SaveAsync();
            return NoContent();
        }
    }
}