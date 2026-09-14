-- CATEGORIAS
INSERT INTO fagroz.estoque_categorias (nome, descricao, ativo)
VALUES
    ('Produtos Químicos', 'Sanitizantes e químicos de uso geral', TRUE),
    ('Limpeza e Manutenção', 'Materiais de limpeza e conservação', TRUE),
    ('Descartáveis e Utensílios', 'Itens de uso descartável', TRUE),
    ('Escritório e Papelaria', 'Suprimentos administrativos', TRUE),
    ('Equipamentos e Eletrônicos', 'Equipamentos de apoio', FALSE);

-- FORNECEDORES
INSERT INTO fagroz.estoque_fornecedores (nome, cnpj)
VALUES
    ('BRS Suprimentos Corporativos S/A (Br Supply)', '03.746.938/0001-43');

-- SETORES
INSERT INTO fagroz.estoque_setores (nome, sigla, ativo)
VALUES
    ('Secretaria', 'SEC', TRUE),
    ('Laboratório', 'LAB', TRUE),
    ('Campo Experimental', 'CEX', TRUE),
    ('Almoxarifado', 'ALM', TRUE),
    ('Coordenação', 'COO', TRUE),
    ('Sala de Professores', 'SPR', TRUE);

-- MATERIAIS
INSERT INTO fagroz.estoque_materiais
  (codigo, nome, categoria_id, estoque_central, estoque_minimo)
VALUES
  ('MAT-001', 'Papel Higiênico', 2, 0, 100),
  ('MAT-002', 'Papel Toalha', 3, 0, 150),
  ('MAT-003', 'Detergente', 2, 0, 50),
  ('MAT-004', 'Água Sanitária', 1, 0, 30),
  ('MAT-005', 'Papel A4', 4, 0, 100),
  ('MAT-006', 'Desinfetante', 1, 0, 30),
  ('MAT-007', 'Limpador Multiuso', 2, 0, 100),
  ('MAT-008', 'Saco para Lixo Alta Resistência', 3, 0, 100),
  ('MAT-009', 'Sabonete Líquido', 2, 0, 50);

-- POSSES
INSERT INTO fagroz.estoque_posses
  (material_id, setor_id, quantidade, ultima_saida)
VALUES
    -- Papel Higiênico
    (1, 1, 40, '2026-08-01 09:00:00'), -- Secretaria
    (1, 2, 60, '2026-08-02 10:30:00'), -- Laboratório
    (1, 3, 30, '2026-08-03 14:00:00'), -- Campo Experimental

    -- Papel Toalha
    (2, 1, 20, '2026-08-04 09:15:00'), -- Secretaria
    (2, 2, 30, '2026-08-05 11:00:00'), -- Laboratório
    (2, 4, 25, '2026-08-06 15:30:00'), -- Almoxarifado

    -- Detergente
    (3, 2, 20, '2026-08-07 08:30:00'), -- Laboratório
    (3, 3, 15, '2026-08-08 13:00:00'), -- Campo Experimental

    -- Água Sanitária
    (4, 2, 20, '2026-08-09 09:45:00'), -- Laboratório
    (4, 3, 10, '2026-08-10 14:30:00'), -- Campo Experimental

    -- Papel A4
    (5, 1, 50, '2026-08-11 10:00:00'), -- Secretaria
    (5, 5, 30, '2026-08-12 11:30:00'), -- Coordenação

    -- Desinfetante
    (6, 2, 20, '2026-08-13 08:45:00'), -- Laboratório
    (6, 6, 10, '2026-08-14 16:00:00'), -- Sala de Professores

    -- Limpador Multiuso
    (7, 1, 25, '2026-08-15 09:00:00'), -- Secretaria
    (7, 3, 15, '2026-08-16 13:30:00'), -- Campo Experimental

    -- Saco para Lixo Alta Resistência
    (8, 1, 30, '2026-08-17 10:15:00'), -- Secretaria
    (8, 2, 40, '2026-08-17 14:00:00'), -- Laboratório
    (8, 3, 20, '2026-08-18 09:30:00'), -- Campo Experimental

    -- Sabonete Líquido
    (9, 1, 20, '2026-08-18 11:00:00'), -- Secretaria
    (9, 2, 25, '2026-08-18 15:00:00'); -- Laboratório

-- USUÁRIOS
INSERT INTO fagroz.estoque_usuarios
  (nome, email, cargo, role, ativo)
VALUES
  (
    'Administrador do Sistema',
    'admin@fagronomia.ufrgs.br',
    'Administrador',
    'admin',
    TRUE
  ),
  (
    'Responsável pelo Almoxarifado',
    'almoxarifado@fagronomia.ufrgs.br',
    'Almoxarife',
    'almoxarife',
    TRUE
  ),
  (
    'João da Silva',
    'joao.silva@fagronomia.ufrgs.br',
    'Técnico Administrativo',
    'almoxarife',
    TRUE
  ),
  (
    'Maria Souza',
    'maria.souza@fagronomia.ufrgs.br',
    'Servidora',
    'leitor',
    TRUE
  );


-- PEDIDOS
INSERT INTO fagroz.estoque_pedidos
  (numero, data, fornecedor_id, solicitante_id, situacao)
VALUES
    (
        'PED-2026-001',
        '2026-07-01',
        1,
        2,
        'recebido'
    ),
    (
        'PED-2026-002',
        '2026-07-05',
        1,
        2,
        'recebido'
    ),
    (
        'PED-2026-003',
        '2026-07-10',
        1,
        3,
        'recebido'
    ),
    (
        'PED-2026-004',
        '2026-07-15',
        1,
        2,
        'recebido'
    );


-- PEDIDOS_ITENS
INSERT INTO fagroz.estoque_pedido_itens
  (
    pedido_id,
    material_id,
    quantidade,
    valor_unitario,
    quantidade_recebida
  )
VALUES

    -- Pedido 1
    (1, 1, 130, 18.50, 130),
    (1, 2, 75, 22.00, 75),
    (1, 3, 35, 8.90, 35),

    -- Pedido 2
    (2, 4, 30, 12.50, 30),
    (2, 5, 80, 32.90, 80),
    (2, 6, 30, 14.90, 30),

    -- Pedido 3
    (3, 7, 40, 11.50, 40),
    (3, 8, 90, 28.00, 90),

    -- Pedido 4
    (4, 9, 45, 16.90, 45);


-- MOVIMENTAÇÕES
INSERT INTO fagroz.estoque_movimentacoes
  (
    data,
    material_id,
    tipo,
    quantidade,
    setor_id,
    responsavel_id,
    pedido_id,
    observacao
  )
VALUES

    -- ========================================================
    -- ENTRADAS DE COMPRAS
    -- ========================================================

    -- Papel Higiênico
    (
        '2026-07-02 09:00:00',
        1,
        'entrada',
        130,
        NULL,
        2,
        1,
        'Recebimento do pedido PED-2026-001'
    ),

    -- Papel Toalha
    (
        '2026-07-02 09:10:00',
        2,
        'entrada',
        75,
        NULL,
        2,
        1,
        'Recebimento do pedido PED-2026-001'
    ),

    -- Detergente
    (
        '2026-07-02 09:20:00',
        3,
        'entrada',
        35,
        NULL,
        2,
        1,
        'Recebimento do pedido PED-2026-001'
    ),

    -- Água Sanitária
    (
        '2026-07-06 10:00:00',
        4,
        'entrada',
        30,
        NULL,
        2,
        2,
        'Recebimento do pedido PED-2026-002'
    ),

    -- Papel A4
    (
        '2026-07-06 10:10:00',
        5,
        'entrada',
        80,
        NULL,
        2,
        2,
        'Recebimento do pedido PED-2026-002'
    ),

    -- Desinfetante
    (
        '2026-07-06 10:20:00',
        6,
        'entrada',
        30,
        NULL,
        2,
        2,
        'Recebimento do pedido PED-2026-002'
    ),

    -- Limpador Multiuso
    (
        '2026-07-11 14:00:00',
        7,
        'entrada',
        40,
        NULL,
        3,
        3,
        'Recebimento do pedido PED-2026-003'
    ),

    -- Saco para Lixo
    (
        '2026-07-11 14:10:00',
        8,
        'entrada',
        90,
        NULL,
        3,
        3,
        'Recebimento do pedido PED-2026-003'
    ),

    -- Sabonete Líquido
    (
        '2026-07-16 11:00:00',
        9,
        'entrada',
        45,
        NULL,
        2,
        4,
        'Recebimento do pedido PED-2026-004'
    ),

    -- ========================================================
    -- SAÍDAS PARA OS SETORES
    -- ========================================================

    -- Papel Higiênico
    (
        '2026-08-01 09:00:00',
        1,
        'saida',
        40,
        1,
        2,
        NULL,
        'Entrega para a Secretaria'
    ),
    (
        '2026-08-02 10:30:00',
        1,
        'saida',
        60,
        2,
        2,
        NULL,
        'Entrega para o Laboratório'
    ),
    (
        '2026-08-03 14:00:00',
        1,
        'saida',
        30,
        3,
        2,
        NULL,
        'Entrega para o Campo Experimental'
    ),

    -- Papel Toalha
    (
        '2026-08-04 09:15:00',
        2,
        'saida',
        20,
        1,
        2,
        NULL,
        'Entrega para a Secretaria'
    ),
    (
        '2026-08-05 11:00:00',
        2,
        'saida',
        30,
        2,
        2,
        NULL,
        'Entrega para o Laboratório'
    ),
    (
        '2026-08-06 15:30:00',
        2,
        'saida',
        25,
        4,
        2,
        NULL,
        'Entrega para o Almoxarifado'
    ),

    -- Detergente
    (
        '2026-08-07 08:30:00',
        3,
        'saida',
        20,
        2,
        2,
        NULL,
        'Entrega para o Laboratório'
    ),
    (
        '2026-08-08 13:00:00',
        3,
        'saida',
        15,
        3,
        2,
        NULL,
        'Entrega para o Campo Experimental'
    ),

    -- Água Sanitária
    (
        '2026-08-09 09:45:00',
        4,
        'saida',
        20,
        2,
        2,
        NULL,
        'Entrega para o Laboratório'
    ),
    (
        '2026-08-10 14:30:00',
        4,
        'saida',
        10,
        3,
        2,
        NULL,
        'Entrega para o Campo Experimental'
    ),

    -- Papel A4
    (
        '2026-08-11 10:00:00',
        5,
        'saida',
        50,
        1,
        2,
        NULL,
        'Entrega para a Secretaria'
    ),
    (
        '2026-08-12 11:30:00',
        5,
        'saida',
        30,
        5,
        2,
        NULL,
        'Entrega para a Coordenação'
    ),

    -- Desinfetante
    (
        '2026-08-13 08:45:00',
        6,
        'saida',
        20,
        2,
        3,
        NULL,
        'Entrega para o Laboratório'
    ),
    (
        '2026-08-14 16:00:00',
        6,
        'saida',
        10,
        6,
        3,
        NULL,
        'Entrega para a Sala de Professores'
    ),

    -- Limpador Multiuso
    (
        '2026-08-15 09:00:00',
        7,
        'saida',
        25,
        1,
        2,
        NULL,
        'Entrega para a Secretaria'
    ),
    (
        '2026-08-16 13:30:00',
        7,
        'saida',
        15,
        3,
        2,
        NULL,
        'Entrega para o Campo Experimental'
    ),

    -- Saco para Lixo Alta Resistência
    (
        '2026-08-17 10:15:00',
        8,
        'saida',
        30,
        1,
        2,
        NULL,
        'Entrega para a Secretaria'
    ),
    (
        '2026-08-17 14:00:00',
        8,
        'saida',
        40,
        2,
        2,
        NULL,
        'Entrega para o Laboratório'
    ),
    (
        '2026-08-18 09:30:00',
        8,
        'saida',
        20,
        3,
        2,
        NULL,
        'Entrega para o Campo Experimental'
    ),

    -- Sabonete Líquido
    (
        '2026-08-18 11:00:00',
        9,
        'saida',
        20,
        1,
        2,
        NULL,
        'Entrega para a Secretaria'
    ),
    (
        '2026-08-18 15:00:00',
        9,
        'saida',
        25,
        2,
        2,
        NULL,
        'Entrega para o Laboratório'
    );

-- GASTOS
INSERT INTO fagroz.estoque_gastos
  (
    data,
    material_id,
    pedido_id,
    movimentacao_id,
    quantidade,
    valor_total
  )
VALUES
  -- Pedido 1
  (
      '2026-07-02',
      1,
      1,
      1,
      130,
      2405.00
  ),
  (
      '2026-07-02',
      2,
      1,
      2,
      75,
      1650.00
  ),
  (
      '2026-07-02',
      3,
      1,
      3,
      35,
      311.50
  ),

  -- Pedido 2
  (
      '2026-07-06',
      4,
      2,
      4,
      30,
      375.00
  ),
  (
      '2026-07-06',
      5,
      2,
      5,
      80,
      2632.00
  ),
  (
      '2026-07-06',
      6,
      2,
      6,
      30,
      447.00
  ),

  -- Pedido 3
  (
      '2026-07-11',
      7,
      3,
      7,
      40,
      460.00
  ),
  (
      '2026-07-11',
      8,
      3,
      8,
      90,
      2520.00
  ),

  -- Pedido 4
  (
      '2026-07-16',
      9,
      4,
      9,
      45,
      760.50
  );