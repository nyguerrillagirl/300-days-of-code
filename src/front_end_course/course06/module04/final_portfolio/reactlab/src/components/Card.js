import { Heading, HStack, Image, Text, VStack } from "@chakra-ui/react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowRight } from "@fortawesome/free-solid-svg-icons";
import React from "react";

const Card = ({ title, description, imageSrc }) => {
  // Implement the UI for the Card component according to the instructions.
  // You should be able to implement the component with the elements imported above.
  // Feel free to import other UI components from Chakra UI if you wish to.
  return (
    <div style={{ border: "0px solid #14532d", background: "white", color: "black", padding: "0px", borderRadius: "8px"}}>
      <Image rounded="md" src={imageSrc} alt={title} borderRadius="md" fit="cover" w="100%"/>
      <VStack align="start" spacing={2} mt={2}>
        <Heading size="md" p="10px">{title}</Heading>       
          <Text p="10px">{description}</Text>
          <HStack>
            <Text fontSize="sm"  p="10px">See more</Text>
            <FontAwesomeIcon icon={faArrowRight} size="1x"/>
          </HStack>
        </VStack>
      
    </div>
  );
};

export default Card;
