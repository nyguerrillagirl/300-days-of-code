const Header = (props) => {
    return (
        <header {...props}>
            <nav>
                <ul style={{ display: 'flex', listStyle: 'none', padding: 0, margin: 0 }}>
                    <li style={{ marginRight: '20px' }}><a href="#home">Home</a></li>
                    <li style={{ marginRight: '20px' }}><a href="#about">About</a></li>
                    <li style={{ marginRight: '20px' }}><a href="#services">Services</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </nav>
        </header>
    );
}