
import Link from "next/link";
import React from "react";
import { CONTRACT_ADDRESS } from "@/app/constants/CONSTANT";
import zenzoneABI from "@/components/blockchain/zenzoneABI.json";
import { useAccount, useReadContract } from "wagmi";
// import { useRouter } from "next/navigation";
import { Toaster, toast } from "sonner";
import { ethers } from 'ethers';

const page = async () => {
  const { address, isConnected } = useAccount();
  

  const { data, isError, isLoading, error , refetch:begin} = useReadContract({
    abi: zenzoneABI,
    address: CONTRACT_ADDRESS,
    functionName: "getStruct",
    args: [address],
  });

  console.log(data);
  if (isConnected){
    await begin();
    console.log(data);
  }

  const result = (data as Result[]) ||[];

  interface Result {
    addr: string;
    data: string;
    structType: number;
    
  }

  console.log(data);
  console.log(result[2]);

  const match = async () => {
    await begin();
    console.log("done");
    console.log(data);

  } 
  
 
  console.log(result);






  return (
    <div> Funny </div>
  );
};

export default page;
