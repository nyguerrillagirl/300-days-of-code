import { Box, HStack, Link, Button } from "@chakra-ui/react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const socials = [
   { icon: "faGithub", url: "https://github.com/nyguerrillagirl"},
];

const SocialMediaLinks = () => {
    return (
      <HStack spacing={4}>
        {socials.map((social, index) => (
          <a
            key={index}
            href={socials.url}
            target="_blank"
            rel="noopener noreferrer"
          >
            <FontAwesomeIcon icon={socials.icon} size="lg" />
          </a>
        ))}
      </HStack>
    );
};

const InternalLinks = () => {
    return (
        <>
            <Link href="#projects" marginRight="5" color="white" fontSize="lg">Projects</Link>
           <Link href="#projects" marginRight="5" color="white" fontSize="lg">Blogs</Link>
            <Link href="#contact" marginRight="5" color="white" fontSize="lg">Contact Me</Link>
        </>
    );
};

const Header = () => {
    return (
    <Box w="100%" p={4} display="flex" justifyContent="space-between" bg="#4299E1">
      {/* Left-Aligned HStack */}
      <HStack ml={10}>
        <Button colorScheme="blue">Left 1</Button>
        <Button colorScheme="blue">Left 2</Button>
      </HStack>

    <HStack>
      <Button colorScheme="blue">Middle</Button>  
    </HStack>
      {/* Right-Aligned HStack */}
      <HStack mr={10}>
        <Button colorScheme="green">Right 1</Button>
        <Button colorScheme="green">Right 2</Button>
      </HStack>
    </Box>

    );
}

export default Header;    