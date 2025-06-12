import React from "react";
import { HStack, VStack, Image, Heading, Text } from "@chakra-ui/react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowRight } from "@fortawesome/free-solid-svg-icons";

// ✅ Correct prop destructuring
const Card = ({ title, description, imageSrc }) => {
  // Debug log to verify props
  console.log("Card props received:", { title, description, imageSrc });

  return (
    <VStack
      color="black"
      spacing={4}
      align="start"
      bg="white"
      borderRadius="md"
      boxShadow="md"
      p={4}
      _hover={{ boxShadow: "lg", transform: "scale(1.02)" }}
      transition="all 0.2s"
    >
      <Image src={imageSrc} alt={title} borderRadius="md" />
      <Heading size="md">{title}</Heading>
      <Text>{description}</Text>
      <HStack spacing={2} color="blue.500" cursor="pointer">
        <Text fontWeight="bold">See More</Text>
        <FontAwesomeIcon icon={faArrowRight} size="1x" />
      </HStack>
    </VStack>
  );
};

export default Card;