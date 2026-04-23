// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaGambia
 * @dev Registro de procesos de emulsion lipidica y termodinámica del arroz.
 * Serie: Sabores de Africa (46/54)
 */
contract CulturaGambia {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 estabilidadEmulsion;  // Resistencia a la separacion de aceites (1-100)
        uint256 integridadGrano;     // Firmeza del arroz tras la coccion (1-10)
        bool equilibrioAcido;        // Uso de limon/tomate para estabilizar proteinas
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Domoda (Ingenieria de la Suspension)
        registrarPlato(
            "Domoda", 
            "Pasta de cacahuete natural, carne o pescado, zumo de limon, tomate, verduras.",
            "Emulsion de pasta de cacahuete en un caldo acido para crear una salsa espesa y estable.",
            95, 
            2, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _emulsion, 
        uint256 _integridad,
        bool _acido
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_emulsion <= 100, "Escala de emulsion excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            estabilidadEmulsion: _emulsion,
            integridadGrano: _integridad,
            equilibrioAcido: _acido,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
