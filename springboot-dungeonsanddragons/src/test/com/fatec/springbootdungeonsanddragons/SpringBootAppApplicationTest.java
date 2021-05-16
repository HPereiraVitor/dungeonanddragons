package br.gov.sp.fatec.springbootdungeonsanddragons;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.util.HashSet;
import java.util.List;

import org.springfamework.beans.factory.annotation.Autowired;
import org.springfamework.boot.test.context.SpringBootTest;
import org.springfamework.test.annotation.Rollback;
import org.springfamework.transaction.annotation.transactional;

import com.fatec.springbootdungeonsanddragons.entity.Autorizacao;
import com.fatec.springbootdungeonsanddragons.entity.Usuario;
import com.fatec.springbootdungeonsanddragons.repository.AutorizacaoRepository;
import com.fatec.springbootdungeonsanddragons.repository.UsuarioRepository;
import com.fatec.springbootdungeonsanddragons.service.SegurancaService;

@SpringBootTest
@Transactional
Rollback
class SpringBootAppApplicationTests {
    
}