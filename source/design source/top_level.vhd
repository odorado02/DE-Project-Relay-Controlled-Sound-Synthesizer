----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 04:22:25 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( BTNR : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           RA : out STD_LOGIC_VECTOR (3 downto 0);
           RB : out STD_LOGIC_VECTOR (3 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           LED_G : out STD_LOGIC;
           LED_B : out STD_LOGIC);
end top_level;

architecture behavioral of top_level is

    -- contant
    constant ADDR_lengh : integer := 9;
    constant ADDR_MAX : integer := 127;
    
    -- Component declaration for debounce
    
component debounce 
    
    PORT ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           bouncey : in STD_LOGIC;
           clean : out STD_LOGIC;
           pos_edge : out STD_LOGIC;
           neg_edge : out STD_LOGIC);

end component;
    
   -- Component declaration for simple_counter
    
component simple_counter
        generic(
            N : integer := 7
            );
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               en : in STD_LOGIC;
               count : out STD_LOGIC_VECTOR (N-1 downto 0));
    end component;

    -- Component declaration for up_and_down_counter
        component up_and_down_counter
        generic(
            N : integer := 2
            );
        Port ( clk : in STD_LOGIC;
               INC : in STD_LOGIC;
               rst : IN STD_LOGIC;
               EN : IN STD_LOGIC;          
               COUNT : out STD_LOGIC_VECTOR (N-1 downto 0));
        end component;

    -- Component declaration for bin2seg
        component bin2seg
        Port ( clear : in STD_LOGIC;
           bin : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0)
           );
        end component;
    

    -- Component declaration for ROM
        component ROM
        generic
            (
                N_data    : natural := 2;
                N_addr    : natural := ADDR_lengh
            );
        Port ( clk : in STD_LOGIC;
               address : in STD_LOGIC_VECTOR (N_addr-1 downto 0);
               data : out STD_LOGIC_VECTOR (N_data-1 downto 0));
        end component;
        
    -- Component declaration for clock_enable
        component clock_enable
        generic (
            PERIOD : integer := 10_000_000
        );
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               pulse : out STD_LOGIC
        );
        end component;
    
    -- Component declaration for encouder
        component encoder
        Port (
            output : out std_logic_vector(3 downto 0) ;
            entree : in std_logic_vector(2 downto 0) );
        end component;
        
    -- Local signals
    signal sig_EN : std_logic;
    signal n_rst : std_logic;
    signal sig_btnl : std_logic;
    signal sig_btnr : std_logic;
    signal sig_btnc : std_logic;
    signal sig_count : std_logic;
    signal sig_pulse : std_logic;
    signal sig_synA : std_logic;
    signal sig_synB : std_logic;
    signal sig_melody : std_logic_vector(1 downto 0);
    signal sig_addr : std_logic_vector(6 downto 0);
    signal sig_count_A : std_logic_vector(2 downto 0);
    signal sig_count_B : std_logic_vector(2 downto 0);
    signal sig_data : std_logic_vector(3 downto 0);
    
    
    -- Define states for the FSM
    type  state_type is (STOP, PLAY);
    signal state : state_type;
    

begin

    -- inverted reset
    n_rst <= not rst;
    
    
    -- Component instantiation of debounce
    
    left : debounce 
    port map ( clk => clk,
               rst => rst,
               en => '1',
               bouncey => BTNL,
               clean => open,
               pos_edge => sig_btnl,
               neg_edge => open
               );

    
    right : debounce 
    port map ( clk => clk,
               rst => rst,
               en => '1',
               bouncey => BTNR,
               clean => open,
               pos_edge => sig_btnr,
               neg_edge => open
               );
        
    center : debounce 
    port map ( clk => clk,
               rst => rst,
               en => '1',
               bouncey => BTNC,
               clean => open,
               pos_edge => sig_btnc,
               neg_edge => open
               );
        
    -- Component instantiation of clock enable for 500 ms
    clock_en : clock_enable
    generic map (
       PERIOD => 10_000_000 --10Hz @ 10 Mhz
    )
    port map (
       clk => clk,
       rst => rst,
       pulse => sig_pulse   
    );


    -- Component instantiation of up_and_down_counter
    melody_selector : up_and_down_counter
    generic map (
    N => 2
    )
    port map (
       clk => clk,
       INC => BTNR,
       rst => rst,
       EN => sig_EN,
       COUNT => sig_melody
    );
    
    addr_counter : simple_counter
    port map (
       clk => clk,
       rst => rst,
       EN => sig_count,
       COUNT => sig_addr (6 downto 0) 
    );
    
    synth1 : up_and_down_counter
    generic map (
    N => 3
    )
    port map (
       clk => clk,
       INC => sig_data(1),
       rst => rst,
       EN => sig_synA,
       COUNT => sig_count_A
    );
    
    synth2 : up_and_down_counter
    generic map (
    N => 3
    )
    port map (
       clk => clk,
       INC => sig_data(3),
       rst => rst,
       EN => sig_synB,
       COUNT => sig_count_B
    );


    -- Component instantiation of bin2seg
    bin2 : bin2seg
    port map (
       clear => rst,
       bin(1 downto 0) => sig_melody,
       bin(3 downto 2) => "00",
       seg(6) => CA,
       seg(5) => CB,
       seg(4) => CC,
       seg(3) => CD,
       seg(2) => CE,
       seg(1) => CF,
       seg(0) => CG
    );    
   
    -- Component instantiation of ROM
     ROM_memory : ROM
    generic map (
       N_data => 4,
       N_addr => ADDR_lengh
    )
    port map (
       clk => clk,
       address(6 downto 0) => sig_addr,
       address(8 downto 7) => sig_melody,
       data => sig_data
    );   

    -- Component instantiation of encodeur

    encoder_A : encoder
    port map (
       entree => sig_count_A,
       output => RA
    );
    
    encoder_B : encoder
    port map (
       entree => sig_count_B,
       output => RB
    );
    
    -- State machine
   
   fsm : process (clk,rst,sig_btnr,sig_btnl, sig_btnc) is
    begin
        -- Active-high reset
        if (rst = '1') then
            state <= STOP;
        elsif rising_edge (clk) then
           -- Define transitions between states
            case state is
                when STOP =>
                    LED_G <= '1';
                    LED_B <= '0';
                    sig_count <= '0';
                    sig_synA <='0';
                    sig_synB <='0';
                    if (sig_btnr = '1') or (sig_btnl = '1') then
                        sig_EN <= '1';
                        
                    else 
                        sig_EN <= '0';
                    end if;
                    if (sig_btnc = '1') then
                        state <= PLAY;
                    end if;
                    
                when PLAY =>
                    -- If button = 1 increment counter
                    LED_G <= '0';
                    LED_B <= '1';
                    sig_EN <= '0';
                    sig_count <= sig_pulse;
                    sig_synA <= sig_pulse and sig_data(0);
                    sig_synB <= sig_pulse and sig_data(2);
                    if (sig_btnc = '1') or ((sig_addr) = std_logic_vector(to_unsigned(ADDR_MAX, sig_addr'length))) then 
                        state <= STOP;
                    end if;      
                -- Prevent unhandled cases
                when others =>
                   null;
            end case;
         end if;
    end process fsm;


    --- TURN OFF the DP
    DP <= '1';
    
    ---- Select the display position
    AN <= b"1111_1110";
    
    ---- 

end architecture behavioral;
