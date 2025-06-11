import { Box, Flex, Link, Heading } from "@chakra-ui/react";

const Header = () => {
    return (
        <Box as="header" bg="blue.500" color="white" px={6} py={4}>
            <Flex maxW="1200px" mx="auto" justify="space-between" align="center">
                <Heading size="lg">My Website</Heading>
                <Flex gap={4}>
                    <Link href="/" fontWeight="bold">Home</Link>
                    <Link href="/about" fontWeight="bold">About</Link>
                    <Link href="/contact" fontWeight="bold">Contact</Link>
                </Flex>
            </Flex>           
        </Box>
    );
}

export default Header;
