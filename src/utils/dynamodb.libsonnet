{
  new(description): {
    AWSTemplateFormatVersion: '2010-09-09',
    Description: description,
    Parameters: {
      HashKeyElementName: {
        Type: 'String',
        Default: 'EmployeeId',
        Description: 'Hash Key Name',
      },
      HashKeyElementType: {
        Type: 'String',
        Default: 'S',
        Description: 'Hash Key Type',
      },
    },
    Resources: {
      EmployeeTable: {
        Type: 'AWS::DynamoDB::Table',
        Properties: {
          TableName: 'Employee',
          AttributeDefinitions: [
            {
              AttributeName: {
                Ref: 'HashKeyElementName',
              },
              AttributeType: {
                Ref: 'HashKeyElementType',
              },
            },
          ],
          KeySchema: [
            {
              AttributeName: {
                Ref: 'HashKeyElementName',
              },
              KeyType: 'HASH',
            },
          ],
          ProvisionedThroughput: {
            ReadCapacityUnits: 5,
            WriteCapacityUnits: 5,
          },
        },
      },
    },
    Outputs: {
      Employee: {
        Description: 'Table Created using this template.',
        Value: {
          Ref: 'EmployeeTable',
        },
      },
    },
  },
}